import 'dart:convert';

import 'package:moneyappbaru/data/model/category.dart';

class GetAllCategoryResponse {
  final String status;
  final String message;
  final List<Category> data;

  GetAllCategoryResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetAllCategoryResponse.fromJson(String str) =>
      GetAllCategoryResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetAllCategoryResponse.fromMap(Map<String, dynamic> json) =>
      GetAllCategoryResponse(
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
