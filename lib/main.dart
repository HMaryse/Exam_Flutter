import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';
import 'providers/wallet_provider.dart';
import 'features/auth/screens/splash_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => WalletProvider(),
      child: const BadWalletApp(),
    ),
  );
}

class BadWalletApp extends StatelessWidget {
  const BadWalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BadWallet',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}