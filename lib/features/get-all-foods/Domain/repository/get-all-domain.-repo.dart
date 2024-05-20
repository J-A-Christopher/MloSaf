import 'package:dartz/dartz.dart';
import 'package:mlosafi/features/get-all-foods/Domain/entities/get-food-entity.dart';

abstract class GetAllFoodDomainRepo{
   Future<Either<String, List<GetFoodEntity>>> getAllFoods();
}