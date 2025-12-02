import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/feature/home/data/api/home_api.dart';
import 'package:shopping_app/feature/home/data/models/category_response_dto.dart';
import 'package:shopping_app/feature/home/data/models/product_response_dto.dart';
import 'package:shopping_app/feature/home/data/repo/data_source/home_data_source.dart';

class HomeDataSourceImp implements HomeDataSource {
  HomeDataSourceImp(this._api);
  final HomeApi _api;

  @override
  Future<ResultAPI<List<CategoryResponseDTO>>> getCategories() async {
    final result = await _api.getCategories();
    switch (result) {
      case SuccessAPI<List<CategoryResponseDTO>>():
        return SuccessAPI<List<CategoryResponseDTO>>(result.data);
      case ErrorAPI<List<CategoryResponseDTO>>():
        return ErrorAPI<List<CategoryResponseDTO>>(
          messageError: result.messageError,
        );
    }
  }

  @override
  Future<ResultAPI<List<ProductResponseDTO>>> getProducts() async {
    final result = await _api.getProducts();
    switch (result) {
      case SuccessAPI<List<ProductResponseDTO>>():
        return SuccessAPI<List<ProductResponseDTO>>(result.data);
      case ErrorAPI<List<ProductResponseDTO>>():
        return ErrorAPI<List<ProductResponseDTO>>(
          messageError: result.messageError,
        );
    }
  }
}
