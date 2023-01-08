import 'package:foodzo/data/api/api_client.dart';
import 'package:get/get.dart';

class PopularFoodRepo extends GetxService {
  final ApiClient apiClient;

  PopularFoodRepo({required this.apiClient});

  /// function to get popular food list
  Future<Response> getPopularFoodList() async {
    return await apiClient.getData("url");
  }
}
