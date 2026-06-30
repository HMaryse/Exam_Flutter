import 'package:flutter/material.dart';

import '../core/services/api_service.dart';
import '../models/pay_request.dart';

class BillProvider extends ChangeNotifier {

  final ApiService api = ApiService();

  bool loading = false;

  Future<bool> pay(PayRequest request) async {

    loading = true;

    notifyListeners();

    try {

      await api.pay(request);

      loading = false;

      notifyListeners();

      return true;

    } catch (e) {

      debugPrint(e.toString());

      loading = false;

      notifyListeners();

      return false;

    }

  }

}