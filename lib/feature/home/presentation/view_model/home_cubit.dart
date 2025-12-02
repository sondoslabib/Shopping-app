import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/feature/home/data/models/category_response_dto.dart';
import 'package:shopping_app/feature/home/data/models/product_response_dto.dart';
import 'package:shopping_app/feature/home/data/repo/repo/home_repo.dart';
import 'package:shopping_app/feature/home/presentation/view_model/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repo) : super(HomeInitialState());
  final HomeRepo _repo;
  List<CategoryResponseDTO> listOfCategories = [];
  Future<void> getCategories() async {
    emit(HomeLoadingState());
    final result = await _repo.getCategories();
    switch (result) {
      case SuccessAPI<List<CategoryResponseDTO>>():
        listOfCategories = result.data ?? [];
        emit(HomeSuccessState());
      case ErrorAPI<List<CategoryResponseDTO>>():
        emit(HomeErrorState(result.messageError));
    }

    // Future<void> getProducts() async{
    // emit(HomeLoadingState());
    // final result=await _repo.getProducts();
    // switch(result){
    //   case SuccessAPI<List<ProductResponseDTO>>():
    //     listOfCategories=result.data??[];
    //     emit(HomeSuccessState());
    //   case ErrorAPI<List<ProductResponseDTO>>():
    //     emit(HomeErrorState(result.messageError));
    // }
    //}
  }
}
