import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/wallet.dart';
import '../constants/api_constants.dart';

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

}