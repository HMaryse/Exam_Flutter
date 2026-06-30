import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/wallet_provider.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<WalletProvider>();

    final wallet = provider.wallet;

    return Scaffold(

      appBar: AppBar(

        title: const Text("Mon Profil"),

      ),

      body: wallet == null

          ? const Center(

              child: CircularProgressIndicator(),

            )

          : ListView(

              padding: const EdgeInsets.all(20),

              children: [

                const CircleAvatar(

                  radius: 50,

                  backgroundColor: Color(0xFF1E3A8A),

                  child: Icon(

                    Icons.person,

                    color: Colors.white,

                    size: 50,

                  ),

                ),

                const SizedBox(height: 20),

                Center(

                  child: Text(

                    wallet.phoneNumber,

                    style: const TextStyle(

                      fontWeight: FontWeight.bold,

                      fontSize: 22,

                    ),

                  ),

                ),

                const SizedBox(height: 30),

                Card(

                  child: Column(

                    children: [

                      ListTile(

                        leading: const Icon(Icons.badge),

                        title: const Text("Code Wallet"),

                        subtitle: Text(wallet.code),

                      ),

                      const Divider(height: 1),

                      ListTile(

                        leading: const Icon(Icons.email),

                        title: const Text("Adresse Email"),

                        subtitle: Text(wallet.email),

                      ),

                      const Divider(height: 1),

                      ListTile(

                        leading: const Icon(Icons.account_balance_wallet),

                        title: const Text("Solde"),

                        subtitle: Text(

                          "${wallet.balance.toStringAsFixed(0)} ${wallet.currency}",

                        ),

                      ),

                      const Divider(height: 1),

                      ListTile(

                        leading: const Icon(Icons.language),

                        title: const Text("Devise"),

                        subtitle: Text(wallet.currency),

                      ),

                    ],

                  ),

                ),

                const SizedBox(height: 40),

                SizedBox(

                  height: 55,

                  child: ElevatedButton.icon(

                    style: ElevatedButton.styleFrom(

                      backgroundColor: Colors.red,

                      foregroundColor: Colors.white,

                    ),

                    onPressed: () {

                      Navigator.popUntil(

                        context,

                        (route) => route.isFirst,

                      );

                    },

                    icon: const Icon(Icons.logout),

                    label: const Text(

                      "SE DÉCONNECTER",

                      style: TextStyle(

                        fontWeight: FontWeight.bold,

                      ),

                    ),

                  ),

                )

              ],

            ),

    );

  }

}