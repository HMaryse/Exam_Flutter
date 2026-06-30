import 'dart:async';

import 'package:flutter/material.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();

    Timer(

      const Duration(seconds: 3),

      () {

        Navigator.pushReplacement(

          context,

          MaterialPageRoute(

            builder: (_) => const LoginScreen(),

          ),

        );

      },

    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Icon(

              Icons.account_balance_wallet,

              size: 90,

              color: Colors.blue.shade900,

            ),

            const SizedBox(height: 20),

            const Text(

              "BadWallet",

              style: TextStyle(

                fontSize: 32,

                fontWeight: FontWeight.bold,

              ),

            ),

            const SizedBox(height: 15),

            const CircularProgressIndicator(),

          ],

        ),

      ),

    );

  }

}