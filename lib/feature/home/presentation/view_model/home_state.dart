abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {}

class HomeErrorState extends HomeState {
  HomeErrorState(this.error);
  final String error;
}
