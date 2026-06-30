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

  final TextEditingController senderController = TextEditingController();
  final TextEditingController receiverController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final walletProvider = context.read<WalletProvider>();

    senderController.text =
        walletProvider.wallet?.phoneNumber ?? "";
  }

  @override
  void dispose() {
    senderController.dispose();
    receiverController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final transferProvider = context.watch<TransferProvider>();

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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [

                      TextFormField(
                        controller: senderController,
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: "Téléphone expéditeur",
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                      ),

                      const SizedBox(height: 20),

                      TextFormField(
                        controller: receiverController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: "Téléphone destinataire",
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {

                          if (value == null || value.isEmpty) {
                            return "Veuillez saisir le numéro du destinataire";
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
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {

                          if (value == null || value.isEmpty) {
                            return "Veuillez saisir un montant";
                          }

                          final amount = double.tryParse(value);

                          if (amount == null) {
                            return "Montant invalide";
                          }

                          if (amount <= 0) {
                            return "Le montant doit être supérieur à zéro";
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
                  icon: transferProvider.loading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
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
                  onPressed: transferProvider.loading
                      ? null
                      : () async {

                          if (!_formKey.currentState!.validate()) {
                            return;
                          }

                          final request = TransferRequest(
                            senderPhone: senderController.text,
                            receiverPhone: receiverController.text,
                            amount: double.parse(amountController.text),
                          );

                          final success =
                              await transferProvider.transfer(request);

                          if (!mounted) return;

                          if (success) {

                            await context
                                .read<WalletProvider>()
                                .refreshBalance();

                            if (!mounted) return;

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Transfert effectué avec succès",
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );

                            Navigator.pop(context);

                          } else {

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Le transfert a échoué",
                                ),
                                backgroundColor: Colors.red,
                              ),
                            );

                          }
                        },
                ),
              ),

              const SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}