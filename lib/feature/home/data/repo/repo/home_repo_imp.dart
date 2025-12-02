import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/feature/home/data/models/category_response_dto.dart';
import 'package:shopping_app/feature/home/data/models/product_response_dto.dart';
import 'package:shopping_app/feature/home/data/repo/data_source/home_data_source.dart';
import 'package:shopping_app/feature/home/data/repo/repo/home_repo.dart';

class HomeRepoImp implements HomeRepo {
  HomeRepoImp(this._dataSource);
  final HomeDataSource _dataSource;

  @override
  Future<ResultAPI<List<CategoryResponseDTO>>> getCategories() =>
      _dataSource.getCategories();
  @override
  Future<ResultAPI<List<ProductResponseDTO>>> getProducts() =>
      _dataSource.getProducts();
}
