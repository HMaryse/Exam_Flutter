import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';
import 'providers/wallet_provider.dart';
import 'features/auth/screens/splash_screen.dart';
import 'providers/transfer_provider.dart';
import 'providers/bill_provider.dart';
import 'providers/history_provider.dart';

void main() {
  runApp(
    MultiProvider(

  providers: [

    ChangeNotifierProvider(

      create: (_) => WalletProvider(),

    ),

    ChangeNotifierProvider(

      create: (_) => TransferProvider(),

    ),
    ChangeNotifierProvider(

  create: (_) => BillProvider(),

),
ChangeNotifierProvider(

  create: (_) => HistoryProvider(),

),

  ],

  child: const BadWalletApp(),

)
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