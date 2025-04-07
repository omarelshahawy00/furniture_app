import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/home/data/models/furniture_model.dart';
import 'package:ecommerce_app/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<String, List<FurnitureModel>>> fetchHomeData() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return right(mockFurnitureList);
    } on Exception catch (e) {
      return left('There is an error: $e');
    }
  }
}
