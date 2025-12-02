import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/feature/home/data/repo/repo/home_repo_imp.dart';
import 'package:shopping_app/feature/home/domain/entities/category_entity.dart';
import 'package:shopping_app/feature/home/domain/repo/repository/home_repo.dart';

class GetCategoryUsecase {
  final HomeRepo _homeRepo;

  GetCategoryUsecase(this._homeRepo);

  Future<ResultAPI<List<CategoryEntity>>> call() async =>
      _homeRepo.getCategories();
}

GetCategoryUsecase injectableGetCategoriesUseCase() =>
    GetCategoryUsecase(injectableHomeRepo());
