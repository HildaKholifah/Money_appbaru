import 'dart:convert';
import 'package:moneyappbaru/data/model/transaction.dart';

class GetTransactionResponse {
  final String status;
  final String message;
  final Transaction data;

  GetTransactionResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  GetTransactionResponse copyWith({
    String? status,
    String? message,
    Transaction? data,
  }) {
    return GetTransactionResponse(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "data": data.toMap(),
  };

  factory GetTransactionResponse.fromMap(Map<String, dynamic> map) {
    return GetTransactionResponse(
      status: map["status"],
      message: map["message"],
      data: Transaction.fromMap(map['data'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory GetTransactionResponse.fromJson(String source) =>
      GetTransactionResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
