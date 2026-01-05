import 'dart:convert';
import 'package:moneyappbaru/data/model/transaction.dart';

class GetAllTransactionResponse {
  final String status;
  final String message;
  List<Transaction> data;

  GetAllTransactionResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetAllTransactionResponse.fromJson(String str) =>
      GetAllTransactionResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetAllTransactionResponse.fromMap(Map<String, dynamic> json) {
      return GetAllTransactionResponse(
        status: json["status"],
        message: json["message"],
        data: List<Transaction>.from(
            json["data"].map((x) => Transaction.fromMap(x))),
      );
  }

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
  };
}
