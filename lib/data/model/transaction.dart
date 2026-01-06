import 'dart:convert';

class Transaction {
  final int id;
  final String categoryName;
  final String categoryType;
  final int amount;
  final DateTime transactionDate;
  final String? note;
  final String? image;
  final DateTime createdAt;
  final DateTime updatedAt;
  Transaction({
    required this.id,
    required this.categoryName,
    required this.categoryType,
    required this.amount,
    required this.transactionDate,
    required this.note,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  Transaction copyWith({
    int? id,
    String? categoryName,
    String? categoryType,
    int? amount,
    DateTime? transactionDate,
    String? note,
    dynamic image,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Transaction(
      id: id ?? this.id,
      categoryName: categoryName ?? this.categoryName,
      categoryType: categoryType ?? this.categoryType,
      amount: amount ?? this.amount,
      transactionDate: transactionDate ?? this.transactionDate,
      note: note ?? this.note,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Transaction.fromJson(String str) =>
      Transaction.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Transaction.fromMap(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] as int,
      categoryName: json['category_name'] as String,
      categoryType: json['category_type'] as String,
      amount: json['amount'] as int,
      transactionDate: DateTime.parse(json['transaction_date'] as String),
      note: json['note'] as String?,
      image: json['image'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'category_name': categoryName,
      'category_type': categoryType,
      'amount': amount,
      'transaction_date':
          "${transactionDate.year.toString().padLeft(4, '0')}-${transactionDate.month.toString().padLeft(2, '0')}-${transactionDate.day.toString().padLeft(2, '0')}",
      'note': note,
      'image': image,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  // @override
  // String toString() {
  //   return 'Transactions(id: $id, categoryName: $categoryName, categoryType: $categoryType, amount: $amount, transactionDate: $transactionDate, note: $note, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
  // }

  // @override
  // bool operator ==(covariant Transactions other) {
  //   if (identical(this, other)) return true;

  //   return other.id == id &&
  //       other.categoryName == categoryName &&
  //       other.categoryType == categoryType &&
  //       other.amount == amount &&
  //       other.transactionDate == transactionDate &&
  //       other.note == note &&
  //       other.image == image &&
  //       other.createdAt == createdAt &&
  //       other.updatedAt == updatedAt;
  // }

  // @override
  // int get hashCode {
  //   return id.hashCode ^
  //       categoryName.hashCode ^
  //       categoryType.hashCode ^
  //       amount.hashCode ^
  //       transactionDate.hashCode ^
  //       note.hashCode ^
  //       image.hashCode ^
  //       createdAt.hashCode ^
  //       updatedAt.hashCode;
  // }
}
