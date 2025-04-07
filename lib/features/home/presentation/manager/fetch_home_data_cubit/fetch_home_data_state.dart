part of 'fetch_home_data_cubit.dart';

@immutable
sealed class FetchHomeDataState {}

final class FetchHomeDataInitial extends FetchHomeDataState {}

final class FetchHomeDataLoading extends FetchHomeDataState {}

final class FetchHomeDataSuccess extends FetchHomeDataState {
  final List<FurnitureModel> furnitureList;

  FetchHomeDataSuccess(this.furnitureList);
}

final class FetchHomeDataFailure extends FetchHomeDataState {
  final String errorMessage;

  FetchHomeDataFailure(this.errorMessage);
}
