import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/pay_request.dart';
import '../../../providers/bill_provider.dart';
import '../../../providers/wallet_provider.dart';

class BillsScreen extends StatefulWidget {

  const BillsScreen({super.key});

  @override
  State<BillsScreen> createState() => _BillsScreenState();

}

class _BillsScreenState extends State<BillsScreen> {

  final amountController = TextEditingController();

  final List<String> services = [

    "SENELEC",

    "WOYAFAL",

    "RAPIDO",

    "ISM",

    "SONATEL",

  ];

  String selectedService = "SENELEC";

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<BillProvider>();

    final walletProvider = context.watch<WalletProvider>();

    return Scaffold(

      appBar: AppBar(

        title: const Text("Paiement de services"),

      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Card(

          elevation: 2,

          child: Padding(

            padding: const EdgeInsets.all(20),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                const Text(

                  "Fournisseur",

                  style: TextStyle(

                    fontWeight: FontWeight.bold,

                  ),

                ),

                const SizedBox(height: 10),

                DropdownButtonFormField<String>(

                  value: selectedService,

                  items: services.map((service) {

                    return DropdownMenuItem(

                      value: service,

                      child: Text(service),

                    );

                  }).toList(),

                  onChanged: (value) {

                    setState(() {

                      selectedService = value!;

                    });

                  },

                ),

                const SizedBox(height: 25),

                TextField(

                  controller: amountController,

                  keyboardType: TextInputType.number,

                  decoration: const InputDecoration(

                    labelText: "Montant",

                    prefixIcon: Icon(Icons.payments),

                  ),

                ),

                const SizedBox(height: 35),

                SizedBox(

                  width: double.infinity,

                  height: 55,

                  child: ElevatedButton.icon(

                    icon: provider.loading

                        ? const SizedBox(

                            width: 20,

                            height: 20,

                            child: CircularProgressIndicator(

                              color: Colors.white,

                              strokeWidth: 2,

                            ),

                          )

                        : const Icon(Icons.payment),

                    label: const Text(

                      "PAYER",

                      style: TextStyle(

                        fontWeight: FontWeight.bold,

                      ),

                    ),

                    onPressed: provider.loading
                        ? null
                        : () async {

                            if (amountController.text.isEmpty) {

                              ScaffoldMessenger.of(context)

                                  .showSnackBar(

                                const SnackBar(

                                  content: Text(

                                    "Veuillez saisir un montant",

                                  ),

                                ),

                              );

                              return;

                            }

                            final request = PayRequest(

                              phoneNumber: walletProvider

                                      .wallet?.phoneNumber ??
                                  "",

                              serviceName: selectedService,

                              amount: double.parse(

                                amountController.text,

                              ),

                            );

                            final success =

                                await provider.pay(request);

                            if (!mounted) return;

                            if (success) {

                              ScaffoldMessenger.of(context)

                                  .showSnackBar(

                                const SnackBar(

                                  content: Text(

                                    "Paiement effectué",

                                  ),

                                ),

                              );

                              Navigator.pop(context);

                            } else {

                              ScaffoldMessenger.of(context)

                                  .showSnackBar(

                                const SnackBar(

                                  content: Text(

                                    "Paiement impossible",

                                  ),

                                ),

                              );

                            }

                          },

                  ),

                )

              ],

            ),

          ),

        ),

      ),

    );

  }

}