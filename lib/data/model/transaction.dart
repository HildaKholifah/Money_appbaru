import 'dart:convert';

class Transactions {
  final int id;
  final String categoryName;
  final String categoryType;
  final int amount;
  final DateTime transactionDate;
  final String note;
  final dynamic image;
  final DateTime createdAt;
  final DateTime updatedAt;
  Transactions({
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

  Transactions copyWith({
    int? id,
    String? categoryName,
    String? categoryType,
    int? amount,
    DateTime? transactionDate,
    String? note,
    dynamic? image,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Transactions(
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'categoryName': categoryName,
      'categoryType': categoryType,
      'amount': amount,
      'transactionDate': transactionDate.millisecondsSinceEpoch,
      'note': note,
      'image': image,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory Transactions.fromMap(Map<String, dynamic> map) {
    return Transactions(
      id: map['id'] as int,
      categoryName: map['categoryName'] as String,
      categoryType: map['categoryType'] as String,
      amount: map['amount'] as int,
      transactionDate: DateTime.fromMillisecondsSinceEpoch(
        map['transactionDate'] as int,
      ),
      note: map['note'] as String,
      image: map['image'] as dynamic,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Transactions.fromJson(String source) =>
      Transactions.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Transactions(id: $id, categoryName: $categoryName, categoryType: $categoryType, amount: $amount, transactionDate: $transactionDate, note: $note, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant Transactions other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.categoryName == categoryName &&
        other.categoryType == categoryType &&
        other.amount == amount &&
        other.transactionDate == transactionDate &&
        other.note == note &&
        other.image == image &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        categoryName.hashCode ^
        categoryType.hashCode ^
        amount.hashCode ^
        transactionDate.hashCode ^
        note.hashCode ^
        image.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
