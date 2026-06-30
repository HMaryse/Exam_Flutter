import 'package:flutter/material.dart';

import '../models/transaction.dart';

class HistoryProvider extends ChangeNotifier {

  final List<TransactionModel> transactions = [

    TransactionModel(

      title: "Paiement SENELEC",

      date: "Aujourd'hui",

      amount: -15000,

      incoming: false,

    ),

    TransactionModel(

      title: "Transfert reçu",

      date: "Hier",

      amount: 25000,

      incoming: true,

    ),

    TransactionModel(

      title: "Paiement ISM",

      date: "12 Juin",

      amount: -50000,

      incoming: false,

    ),

  ];

}