import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/transfer_request.dart';
import '../../../providers/transfer_provider.dart';
import '../../../providers/wallet_provider.dart';

class TransferScreen extends StatefulWidget {

  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();

}

class _TransferScreenState extends State<TransferScreen> {

  final _formKey = GlobalKey<FormState>();

  final senderController = TextEditingController();

  final receiverController = TextEditingController();

  final amountController = TextEditingController();

  @override
  void didChangeDependencies() {

    super.didChangeDependencies();

    final walletProvider = context.read<WalletProvider>();

    senderController.text =
        walletProvider.wallet?.phoneNumber ?? "";

  }

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<TransferProvider>();

    return Scaffold(

      appBar: AppBar(

        title: const Text("Transfert d'argent"),

      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Form(

          key: _formKey,

          child: Column(

            children: [

              Card(

                elevation: 2,

                child: Padding(

                  padding: const EdgeInsets.all(20),

                  child: Column(

                    children: [

                      TextFormField(

                        controller: senderController,

                        readOnly: true,

                        decoration: const InputDecoration(

                          labelText: "Expéditeur",

                          prefixIcon: Icon(Icons.person),

                        ),

                      ),

                      const SizedBox(height: 20),

                      TextFormField(

                        controller: receiverController,

                        keyboardType: TextInputType.phone,

                        decoration: const InputDecoration(

                          labelText: "Destinataire",

                          prefixIcon: Icon(Icons.phone),

                        ),

                        validator: (value) {

                          if (value == null || value.isEmpty) {

                            return "Numéro obligatoire";

                          }

                          if (value == senderController.text) {

                            return "Le destinataire doit être différent";

                          }

                          return null;

                        },

                      ),

                      const SizedBox(height: 20),

                      TextFormField(

                        controller: amountController,

                        keyboardType: TextInputType.number,

                        decoration: const InputDecoration(

                          labelText: "Montant",

                          prefixIcon: Icon(Icons.payments),

                        ),

                        validator: (value) {

                          if (value == null || value.isEmpty) {

                            return "Montant obligatoire";

                          }

                          if (double.tryParse(value) == null) {

                            return "Montant invalide";

                          }

                          return null;

                        },

                      ),

                    ],

                  ),

                ),

              ),

              const SizedBox(height: 30),

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

                      : const Icon(Icons.send),

                  label: const Text(

                    "TRANSFÉRER",

                    style: TextStyle(

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                  onPressed: provider.loading
                      ? null
                      : () async {

                          if (!_formKey.currentState!.validate()) {

                            return;

                          }

                          final request = TransferRequest(

                            senderPhone:

                                senderController.text,

                            receiverPhone:

                                receiverController.text,

                            amount: double.parse(

                              amountController.text,

                            ),

                          );

                          final success = await provider.transfer(

                            request,

                          );

                          if (!mounted) return;

                          if (success) {

                            ScaffoldMessenger.of(context)

                                .showSnackBar(

                              const SnackBar(

                                content: Text(

                                  "Transfert effectué avec succès",

                                ),

                              ),

                            );

                            Navigator.pop(context);

                          } else {

                            ScaffoldMessenger.of(context)

                                .showSnackBar(

                              const SnackBar(

                                content: Text(

                                  "Échec du transfert",

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

    );

  }

}