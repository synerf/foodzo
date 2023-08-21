import 'package:foodzo/data/api/api_client.dart';
import 'package:foodzo/utils/app_constants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  /// function to get popular food list
  Future<Response> getPopularFoodList() async {
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}
