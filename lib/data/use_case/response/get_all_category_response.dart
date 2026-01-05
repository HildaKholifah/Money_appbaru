import 'dart:convert';

import 'package:moneyappbaru/data/model/category.dart';

class getAllCategoryResponse {
  final String status;
  final String message;
  final List<Category> data;

  getAllCategoryResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory getAllCategoryResponse.fromJson(String str) =>
      getAllCategoryResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory getAllCategoryResponse.fromMap(Map<String, dynamic> json) =>
      getAllCategoryResponse(
        status: json["status"],
        message: json["message"],
        data: List<Category>.from(json["data"].map((x) => Category.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
  };
}
