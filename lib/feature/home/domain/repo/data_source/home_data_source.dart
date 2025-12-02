import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/feature/home/data/models/category_response_dto.dart';
import 'package:shopping_app/feature/home/data/models/product_response_dto.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';

abstract class HomeDataSource {
  Future<ResultAPI<List<CategoryResponseDTO>>> getCategories();
  Future<ResultAPI<List<ProductResponseDTO>>> getProducts();
}
