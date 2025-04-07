import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/home/data/models/furniture_model.dart';
import 'package:ecommerce_app/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'fetch_home_data_state.dart';

class FetchHomeDataCubit extends Cubit<FetchHomeDataState> {
  final HomeRepo homeRepo;
  FetchHomeDataCubit(this.homeRepo) : super(FetchHomeDataInitial());
  Future<void> fetchHomeData() async {
    if (isClosed) return;
    emit(FetchHomeDataLoading());

    final result = await homeRepo.fetchHomeData();
    if (isClosed) return;

    result.fold(
      (errorMessage) {
        if (!isClosed) emit(FetchHomeDataFailure(errorMessage));
      },
      (furnitureList) {
        if (!isClosed) emit(FetchHomeDataSuccess(furnitureList));
      },
    );
  }
}
