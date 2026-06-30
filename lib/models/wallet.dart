class Wallet {

  final int id;
  final String code;
  final String phoneNumber;
  final String email;
  final double balance;
  final String currency;

  Wallet({
    required this.id,
    required this.code,
    required this.phoneNumber,
    required this.email,
    required this.balance,
    required this.currency,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) {

    return Wallet(
      id: json["id"],
      code: json["code"],
      phoneNumber: json["phoneNumber"],
      email: json["email"],
      balance: (json["balance"] as num).toDouble(),
      currency: json["currency"],
    );

  }
  Wallet copyWith({

  int? id,
  String? code,
  String? phoneNumber,
  String? email,
  double? balance,
  String? currency,

}) {

  return Wallet(

    id: id ?? this.id,

    code: code ?? this.code,

    phoneNumber: phoneNumber ?? this.phoneNumber,

    email: email ?? this.email,

    balance: balance ?? this.balance,

    currency: currency ?? this.currency,

  );

}

}