import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';
import 'package:shopping_app/feature/home/domain/repo/repository/home_repo.dart';

class GetProductUsecase {
  GetProductUsecase(this._homeRepo);
  final HomeRepo _homeRepo;

  Future<ResultAPI<List<ProdustEntity>>> call() async =>
      _homeRepo.getProducts();
}
