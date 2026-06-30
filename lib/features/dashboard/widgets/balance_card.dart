import 'package:flutter/material.dart';

import '../../../providers/wallet_provider.dart';

class BalanceCard extends StatefulWidget {

  final WalletProvider provider;

  const BalanceCard({
    super.key,
    required this.provider,
  });

  @override
  State<BalanceCard> createState() => _BalanceCardState();

}

class _BalanceCardState extends State<BalanceCard> {

  bool hidden = false;

  @override
  Widget build(BuildContext context) {

    return Container(

      width: double.infinity,

      padding: const EdgeInsets.all(22),

      decoration: BoxDecoration(

        color: const Color(0xFF1E3A8A),

        borderRadius: BorderRadius.circular(20),

      ),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Row(

            children: [

              const Expanded(

                child: Text(

                  "SOLDE DISPONIBLE",

                  style: TextStyle(

                    color: Colors.white70,

                    letterSpacing: 1,

                  ),

                ),

              ),

              IconButton(

                onPressed: () {

                  setState(() {

                    hidden = !hidden;

                  });

                },

                icon: Icon(

                  hidden
                      ? Icons.visibility_off
                      : Icons.visibility,

                  color: Colors.white,

                ),

              )

            ],

          ),

          const SizedBox(height: 20),

          Text(

            hidden

                ? "••••••"

                : "${widget.provider.wallet?.balance.toStringAsFixed(0) ?? 0} XOF",

            style: const TextStyle(

              color: Colors.white,

              fontWeight: FontWeight.bold,

              fontSize: 32,

            ),

          ),

          const SizedBox(height: 18),

          Text(

            widget.provider.wallet?.phoneNumber ?? "",

            style: const TextStyle(

              color: Colors.white70,

            ),

          ),

        ],

      ),

    );

  }

}