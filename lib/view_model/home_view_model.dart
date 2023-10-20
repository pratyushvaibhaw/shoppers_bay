import 'package:flutter/material.dart';
import 'package:shoppers_bay/data/model/product_model.dart';
import 'package:shoppers_bay/data/response/api_response.dart';
import 'package:shoppers_bay/repository/home_repository.dart';

class HomeViewModel with ChangeNotifier {
  final _myrepo = HomeRepository();
  setProductList(ApiResponse<List<ProductModel>> response) {
    productList = response;
    notifyListeners();
  }

  ApiResponse<List<ProductModel>> productList = ApiResponse.loading();

  Future<void> fetchProductsList() async {
    _myrepo.getAllProductApi().then(
      (List<ProductModel> value) {
        // Update ApiResponse to handle a list of products.
        setProductList(ApiResponse.completed(value));
      },
    ).onError(
      (error, stackTrace) {
        setProductList(ApiResponse.error(error.toString()));
      },
    );
  }
}
