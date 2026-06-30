import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/wallet_provider.dart';

import '../widgets/action_button.dart';
import '../widgets/balance_card.dart';

import '../../history/screens/history_screen.dart';
import '../../transfers/screens/transfer_screen.dart';
import '../../bills/screens/bills_screen.dart';

class DashboardScreen extends StatelessWidget {

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<WalletProvider>();

    return Scaffold(

      appBar: AppBar(

        title: const Text("BadWallet"),

        actions: const [

          Padding(

            padding: EdgeInsets.only(right: 16),

            child: Icon(Icons.notifications_none),

          )

        ],

      ),

      body: ListView(

        padding: const EdgeInsets.all(20),

        children: [

          BalanceCard(provider: provider),

          const SizedBox(height: 25),

          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

              ActionButton(

                icon: Icons.send,

                title: "Transfert",

                onTap: () {

                  Navigator.push(

                    context,

                    MaterialPageRoute(

                      builder: (_) => const TransferScreen(),

                    ),

                  );

                },

              ),

              ActionButton(

                icon: Icons.receipt_long,

                title: "Factures",

                onTap: () {

                  Navigator.push(

                    context,

                    MaterialPageRoute(

                      builder: (_) => const BillsScreen(),

                    ),

                  );

                },

              ),

              ActionButton(

                icon: Icons.history,

                title: "Historique",

                onTap: () {

                  Navigator.push(

                    context,

                    MaterialPageRoute(

                      builder: (_) => const HistoryScreen(),

                    ),

                  );

                },

              ),

            ],

          ),

          const SizedBox(height: 35),

          const Text(

            "Dernières transactions",

            style: TextStyle(

              fontSize: 18,

              fontWeight: FontWeight.bold,

            ),

          ),

          const SizedBox(height: 15),

          const Card(

            child: ListTile(

              leading: CircleAvatar(

                child: Icon(Icons.swap_horiz),

              ),

              title: Text("Aucune transaction"),

              subtitle: Text("L'historique sera chargé depuis l'API"),

            ),

          ),

        ],

      ),

    );

  }

}