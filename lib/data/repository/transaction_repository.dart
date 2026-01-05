import 'package:moneyappbaru/data/service/http_service.dart';
import 'package:moneyappbaru/data/use_case/request/add_transaction_request.dart';
import 'package:moneyappbaru/data/use_case/response/get_all_transaction_response.dart';
import 'package:moneyappbaru/data/use_case/response/get_transaction_response.dart';

class TransactionRepository {
  final HttpService httpService;

  TransactionRepository(this.httpService);

  Future<GetAllTransactionResponse> getAllTransaction() async {
    final response = await httpService.get('transactions');
    try {
      if (response.statusCode == 200) {
        final responseData = GetAllTransactionResponse.fromJson(response.body);
        return responseData;
      } else {
        final errorResponse = GetAllTransactionResponse.fromJson(response.body);
        return errorResponse;
      }
    } catch (e) {
      throw Exception('Error parsing transactions: $e');
    }
  }

  Future<GetTransactionResponse> createTransaction({
    AddTransactionRequest? request,
  }) async {
    try {
      // Jika ada image, gunakan postWithFile
      // if (request?.image != null) {

      final response = await httpService.postWithFile(
        'transactions',
        request!.toMap(),
        request.image,
        'image',
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final responseData = GetTransactionResponse.fromJson(response.body);
        return responseData;
      } else {
        final errorResponse = GetTransactionResponse.fromJson(response.body);
        return errorResponse;
      }
    } catch (e) {
      throw Exception('Error creating transaction: $e');
    }
  }
}
