import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/wallet.dart';
import '../constants/api_constants.dart';
import '../../models/transfer_request.dart';
import '../../models/pay_request.dart';

class ApiService {

  Future<Wallet> login(String phone) async {

    final response = await http.get(

      Uri.parse("${ApiConstants.wallets}/$phone"),

    );

    if (response.statusCode == 200) {

      return Wallet.fromJson(

        jsonDecode(response.body),

      );

    }

    throw Exception("Wallet introuvable");

  }

  Future<double> getBalance(String phone) async {

    final response = await http.get(

      Uri.parse("${ApiConstants.wallets}/$phone/balance"),

    );

    if (response.statusCode == 200) {

      return double.parse(response.body);

    }

    throw Exception("Impossible de récupérer le solde");

  }
  Future<void> transfer(TransferRequest request) async {

  final response = await http.post(

    Uri.parse("${ApiConstants.wallets}/transfer"),

    headers: {

      "Content-Type": "application/json",

    },

    body: jsonEncode(

      request.toJson(),

    ),

  );

  if (response.statusCode != 200) {

    throw Exception("Le transfert a échoué");

  }

}
Future<void> pay(PayRequest request) async {

  final response = await http.post(

    Uri.parse("${ApiConstants.wallets}/pay"),

    headers: {

      "Content-Type": "application/json",

    },

    body: jsonEncode(

      request.toJson(),

    ),

  );

  if (response.statusCode != 200) {

    throw Exception("Paiement impossible");

  }

}

}