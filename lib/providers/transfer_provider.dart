import 'package:flutter/material.dart';

import '../core/services/api_service.dart';
import '../models/transfer_request.dart';

class TransferProvider extends ChangeNotifier {

  final ApiService api = ApiService();

  bool loading = false;

  Future<bool> transfer(

    TransferRequest request,

  ) async {

    loading = true;

    notifyListeners();

    try {

      await api.transfer(request);

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