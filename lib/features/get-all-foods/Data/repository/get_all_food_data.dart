import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mlosafi/common/utils/exceptions.dart';
import 'package:mlosafi/di/di.dart';
import 'package:mlosafi/features/get-all-foods/Data/datasources/get_all_foodds.dart';
import 'package:mlosafi/features/get-all-foods/Domain/entities/get-food-entity.dart';
import 'package:mlosafi/features/get-all-foods/Domain/repository/get-all-domain.-repo.dart';

@Injectable(as: GetAllFoodDomainRepo)
class GetAllFoodDomainRepoImpl implements GetAllFoodDomainRepo {
  @override
  Future<Either<String, List<GetFoodEntity>>> getAllFoods() async {
    try {
      final foodData = await getIt<GetAllFoodData>().getAllFoods();
      return right(foodData);
    } on RequestException catch (e) {
      return left(e.message);
    } on NetworkException catch (e) {
      return left(e.message);
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      return left('An unknown error occurred. Try again later');
    }
  }
}
