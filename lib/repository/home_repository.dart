import 'package:shoppers_bay/data/model/product_model.dart';
import 'package:shoppers_bay/data/network/BaseApiServices.dart';
import 'package:shoppers_bay/data/network/NetworkApiService.dart';
import 'package:shoppers_bay/res/app_url.dart';

class HomeRepository {
  BaseApiService _apiServices = NetworkApiService();
  Future<List<ProductModel>> getAllProductApi() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.baseUrl);

      // Here, you should check if the response is a list before parsing.
      if (response is List) {
        List<ProductModel> products = response
            .map((productJson) => ProductModel.fromJson(productJson))
            .toList();
        return products;
      } else {
        throw Exception("Invalid response format");
      }
    } catch (e) {
      throw e;
    }
  }

}
