import 'package:moneyappbaru/data/service/http_service.dart';
import 'package:moneyappbaru/data/use_case/response/get_all_transaction_response.dart';

class TransactionRepository {
  final HttpService httpService;

  TransactionRepository(this.httpService);

  Future<GetAllTransactionResponse> getAllTransaction() async {
    final response = await httpService.get('transactions');
    if (response.statusCode == 200) {
      final responseData = GetAllTransactionResponse.fromJson(response.body);
      return responseData;
    } else {
      final errorResponse = GetAllTransactionResponse.fromJson(response.body);
      return errorResponse;
    }
  }
}
