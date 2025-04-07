import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/home/data/models/furniture_model.dart';

abstract class HomeRepo {
  Future<Either< String, List<FurnitureModel>>> fetchHomeData();
}