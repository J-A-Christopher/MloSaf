import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mlosafi/di/di.dart';
import 'package:mlosafi/features/get-all-foods/Domain/entities/get-food-entity.dart';
import 'package:mlosafi/features/get-all-foods/Domain/repository/get-all-domain.-repo.dart';

@injectable
class GetAllFoodUseCase {
  Future<Either<String, List<GetFoodEntity>>> getFoodUseCase() async {
    final foodData = await getIt<GetAllFoodDomainRepo>().getAllFoods();
    return foodData;
  }
}
