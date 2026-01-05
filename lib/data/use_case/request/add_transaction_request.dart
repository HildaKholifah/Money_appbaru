import 'dart:io';

class AddTransactionRequest {
  final int categoryId;
  final String amount;
  final String transactionDate;
  final String? note;
  final File? image;

  AddTransactionRequest({
    required this.categoryId,
    required this.amount,
    required this.transactionDate,
    this.note,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, String>{
      'category_id': categoryId.toString(),
      'amount': amount,
      'transaction_date': transactionDate,
      'note': note!,
      'image': image != null ? image!.path : '',
    };
  }
}
