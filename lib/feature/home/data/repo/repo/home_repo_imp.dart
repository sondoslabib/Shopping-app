import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/feature/home/data/repo/data_source/home_data_source_imp.dart';
import 'package:shopping_app/feature/home/domain/entities/category_entity.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';
import 'package:shopping_app/feature/home/domain/repo/data_source/home_data_source.dart';

import 'package:shopping_app/feature/home/domain/repo/repository/home_repo.dart';

class HomeRepoImp implements HomeRepo {
  HomeRepoImp(this._dataSource);
  final HomeDataSource _dataSource;

  @override
  Future<ResultAPI<List<CategoryEntity>>> getCategories() =>
      _dataSource.getCategories();
  @override
  Future<ResultAPI<List<ProductEntity>>> getProducts() =>
      _dataSource.getProducts();
}

HomeRepo injectableHomeRepo() => HomeRepoImp(injectableHomeDataSource());
