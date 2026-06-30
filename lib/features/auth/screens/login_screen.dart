import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/wallet_provider.dart';
import '../../dashboard/screens/dashboard_screen.dart';
import '../../../core/navigation/bottom_navigation.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {

  final _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<WalletProvider>();

    return Scaffold(

      body: SafeArea(

        child: Center(

          child: SingleChildScrollView(

            padding: const EdgeInsets.all(24),

            child: Form(

              key: _formKey,

              child: Column(

                children: [

                  const Icon(
                    Icons.account_balance_wallet,
                    size: 90,
                    color: Color(0xFF1E3A8A),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "BadWallet",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Connexion",
                    style: TextStyle(fontSize: 18),
                  ),

                  const SizedBox(height: 40),

                  TextFormField(

                    controller: _phoneController,

                    keyboardType: TextInputType.phone,

                    decoration: const InputDecoration(

                      labelText: "Numéro de téléphone",

                      prefixIcon: Icon(Icons.phone),

                    ),

                    validator: (value) {

                      if (value == null || value.isEmpty) {

                        return "Veuillez saisir votre numéro";

                      }

                      return null;

                    },

                  ),

                  const SizedBox(height: 30),

                  SizedBox(

                    width: double.infinity,

                    height: 55,

                    child: ElevatedButton(

                      onPressed: provider.loading
                          ? null
                          : () async {

                              if (!_formKey.currentState!.validate()) {
                                return;
                              }

                              final success =
                                  await provider.login(_phoneController.text);

                              if (!context.mounted) return;

                              if (success) {

                                Navigator.pushReplacement(

                                  context,

                                  MaterialPageRoute(

                                    builder: (_) =>
                                        const BottomNavigation(),

                                  ),

                                );

                              } else {

                                ScaffoldMessenger.of(context).showSnackBar(

                                  SnackBar(

                                    content: Text(
                                      provider.error ??
                                          "Connexion impossible",
                                    ),

                                  ),

                                );

                              }

                            },

                      child: provider.loading

                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )

                          : const Text(

                              "SE CONNECTER",

                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),

                            ),

                    ),

                  ),

                ],

              ),

            ),

          ),

        ),

      ),

    );

  }

}