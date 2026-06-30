class PayRequest {

  final String phoneNumber;

  final String serviceName;

  final double amount;

  PayRequest({

    required this.phoneNumber,

    required this.serviceName,

    required this.amount,

  });

  Map<String, dynamic> toJson() {

    return {

      "phoneNumber": phoneNumber,

      "serviceName": serviceName,

      "amount": amount,

    };

  }

}