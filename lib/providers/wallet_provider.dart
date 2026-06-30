import 'package:flutter/material.dart';

import '../core/services/api_service.dart';
import '../models/wallet.dart';

class WalletProvider extends ChangeNotifier {

  final ApiService _api = ApiService();

  Wallet? wallet;

  bool loading = false;

  String? error;

  Future<bool> login(String phone) async {

    loading = true;

    error = null;

    notifyListeners();

    try {

      wallet = await _api.login(phone);

      wallet = wallet!.copyWith(
        balance: await _api.getBalance(phone),
      );

      loading = false;

      notifyListeners();

      return true;

    } catch (e) {

      loading = false;

      error = e.toString();

      notifyListeners();

      return false;

    }

  }

}