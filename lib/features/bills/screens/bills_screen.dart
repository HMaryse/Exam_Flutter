import 'package:flutter/material.dart';

class BillsScreen extends StatelessWidget {

  const BillsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text("Paiement des factures"),

      ),

      body: const Center(

        child: Text(

          "Factures",

        ),

      ),

    );

  }

}