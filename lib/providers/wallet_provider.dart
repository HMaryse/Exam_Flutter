import 'package:flutter/material.dart';

import '../core/services/api_service.dart';
import '../models/wallet.dart';

class WalletProvider extends ChangeNotifier {

  final ApiService _api = ApiService();

  Wallet? wallet;

  bool loading = false;

  String? error;

  String? currentPhone;

  Future<bool> login(String phone) async {

    loading = true;

    error = null;

    notifyListeners();

    try {

      currentPhone = phone;

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

  Future<void> refreshBalance() async {

    if (currentPhone == null || wallet == null) {

      return;

    }

    try {

      final balance = await _api.getBalance(currentPhone!);

      wallet = wallet!.copyWith(

        balance: balance,

      );

      notifyListeners();

    } catch (_) {}

  }

  Future<void> refreshWallet() async {

    if (currentPhone == null) {

      return;

    }

    try {

      wallet = await _api.login(currentPhone!);

      wallet = wallet!.copyWith(

        balance: await _api.getBalance(currentPhone!),

      );

      notifyListeners();

    } catch (_) {}

  }

  void logout() {

    wallet = null;

    currentPhone = null;

    error = null;

    notifyListeners();

  }

}