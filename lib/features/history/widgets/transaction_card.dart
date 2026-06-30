import 'package:flutter/material.dart';

import '../../../models/transaction.dart';

class TransactionCard extends StatelessWidget {

  final TransactionModel transaction;

  const TransactionCard({

    super.key,

    required this.transaction,

  });

  @override
  Widget build(BuildContext context) {

    return Card(

      child: ListTile(

        leading: CircleAvatar(

          backgroundColor:

              transaction.incoming

                  ? Colors.green.shade100

                  : Colors.red.shade100,

          child: Icon(

            transaction.incoming

                ? Icons.arrow_downward

                : Icons.arrow_upward,

            color:

                transaction.incoming

                    ? Colors.green

                    : Colors.red,

          ),

        ),

        title: Text(transaction.title),

        subtitle: Text(transaction.date),

        trailing: Text(

          "${transaction.amount.toStringAsFixed(0)} XOF",

          style: TextStyle(

            fontWeight: FontWeight.bold,

            color:

                transaction.incoming

                    ? Colors.green

                    : Colors.red,

          ),

        ),

      ),

    );

  }

}