import 'package:moneyappbaru/data/service/http_service.dart';
import 'package:moneyappbaru/data/use_case/response/get_all_category_response.dart';

class CategoryRepository {
  final HttpService httpService;

  CategoryRepository(this.httpService);

  Future<getAllCategoryResponse> getAllCategory() async {
    final response = await httpService.get('/categories');
    if (response.statusCode == 200) {
      final responseData = getAllCategoryResponse.fromJson(response.body);
      return responseData;
    } else {
      final errorResponse = getAllCategoryResponse.fromJson(response.body);
      return errorResponse;
    }
  }
}
