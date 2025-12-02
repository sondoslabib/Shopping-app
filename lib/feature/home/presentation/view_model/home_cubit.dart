import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/feature/home/domain/entities/category_entity.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';
import 'package:shopping_app/feature/home/domain/usecase/get_category_usecase.dart';
import 'package:shopping_app/feature/home/domain/usecase/get_product_usecase.dart';
import 'package:shopping_app/feature/home/presentation/view_model/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._categoriesUseCase, this._productUsecase)
    : super(HomeInitialState());
  final GetCategoryUsecase _categoriesUseCase;
  final GetProductUsecase _productUsecase;
  List<CategoryEntity> listOfCategories = [];
  List<ProductEntity> listOfProducts = [];

  Future<void> getCategories() async {
    emit(HomeLoadingState());
    final result = await _categoriesUseCase.call();
    switch (result) {
      case SuccessAPI<List<CategoryEntity>>():
        listOfCategories = result.data ?? [];
        emit(HomeSuccessState());
      case ErrorAPI<List<CategoryEntity>>():
        emit(HomeErrorState(result.messageError));
    }
  }

  Future<void> getProducts() async {
    emit(HomeLoadingState());
    final result = await _productUsecase.call();
    switch (result) {
      case SuccessAPI<List<ProductEntity>>():
        listOfProducts = result.data ?? [];

        log(listOfProducts[0].slug.toString());
        emit(HomeSuccessState());
      case ErrorAPI<List<ProductEntity>>():
        emit(HomeErrorState(result.messageError));
    }
  }
}
