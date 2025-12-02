import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/feature/home/data/api/home_api.dart';
import 'package:shopping_app/feature/home/data/models/category_response_dto.dart';
import 'package:shopping_app/feature/home/data/models/product_response_dto.dart';
import 'package:shopping_app/feature/home/domain/entities/category_entity.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';
import 'package:shopping_app/feature/home/domain/repo/data_source/home_data_source.dart';

class HomeDataSourceImp implements HomeDataSource {
  HomeDataSourceImp(this._api);
  final HomeApi _api;

  @override
  Future<ResultAPI<List<CategoryEntity>>> getCategories() async {
    final result = await _api.getCategories();
    switch (result) {
      case SuccessAPI<List<CategoryResponseDTO>>():
        return SuccessAPI<List<CategoryEntity>>(
          result.data!.map((e) => e.toEntity()).toList(),
        );
      case ErrorAPI<List<CategoryResponseDTO>>():
        return ErrorAPI<List<CategoryEntity>>(messageError: result.toString());
    }
  }

  @override
  Future<ResultAPI<List<ProductEntity>>> getProducts() async {
    final result = await _api.getProducts();
    switch (result) {
      case SuccessAPI<List<ProductResponseDTO>>():
        return SuccessAPI<List<ProductEntity>>(
          result.data!.map((e) => e.toEntity()).toList(),
        );
      case ErrorAPI<List<ProductResponseDTO>>():
        return ErrorAPI<List<ProductEntity>>(messageError: result.messageError);
    }
  }
}

HomeDataSource injectableHomeDataSource() =>
    HomeDataSourceImp(injectableHomeApi());
