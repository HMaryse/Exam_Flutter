import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/history_provider.dart';
import '../widgets/transaction_card.dart';

class HistoryScreen extends StatelessWidget {

  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<HistoryProvider>();

    return Scaffold(

      appBar: AppBar(

        title: const Text("Historique"),

      ),

      body: Column(

        children: [

          Container(

            padding: const EdgeInsets.all(20),

            child: TextField(

              decoration: InputDecoration(

                hintText: "Rechercher une transaction",

                prefixIcon: const Icon(Icons.search),

                border: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(12),

                ),

              ),

            ),

          ),

          Padding(

            padding: const EdgeInsets.symmetric(horizontal: 20),

            child: Row(

              children: [

                Expanded(

                  child: Card(

                    child: Padding(

                      padding: const EdgeInsets.all(15),

                      child: Column(

                        children: const [

                          Icon(

                            Icons.arrow_downward,

                            color: Colors.green,

                          ),

                          SizedBox(height: 10),

                          Text(

                            "Entrées",

                            style: TextStyle(

                              fontWeight: FontWeight.bold,

                            ),

                          ),

                        ],

                      ),

                    ),

                  ),

                ),

                const SizedBox(width: 12),

                Expanded(

                  child: Card(

                    child: Padding(

                      padding: const EdgeInsets.all(15),

                      child: Column(

                        children: const [

                          Icon(

                            Icons.arrow_upward,

                            color: Colors.red,

                          ),

                          SizedBox(height: 10),

                          Text(

                            "Sorties",

                            style: TextStyle(

                              fontWeight: FontWeight.bold,

                            ),

                          ),

                        ],

                      ),

                    ),

                  ),

                ),

              ],

            ),

          ),

          const SizedBox(height: 10),

          Expanded(

            child: ListView.builder(

              padding: const EdgeInsets.all(15),

              itemCount: provider.transactions.length,

              itemBuilder: (_, index) {

                return TransactionCard(

                  transaction: provider.transactions[index],

                );

              },

            ),

          )

        ],

      ),

    );

  }

}