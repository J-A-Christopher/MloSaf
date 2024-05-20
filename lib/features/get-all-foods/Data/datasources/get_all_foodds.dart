import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mlosafi/common/utils/constants.dart';
import 'package:mlosafi/common/utils/exceptions.dart';
import 'package:mlosafi/common/utils/storage_utils.dart';
import 'package:mlosafi/di/di.dart';
import 'package:mlosafi/features/get-all-foods/Data/models/get_all_foods_model.dart';

abstract class GetAllFoodData {
  Future<List<GetAllFoodsModel>> getAllFoods();
}

@Injectable(as: GetAllFoodData)
class GetAllFoodDataImpl implements GetAllFoodData {
  @override
  Future<List<GetAllFoodsModel>> getAllFoods() async {
    final dio = Dio();
    final token = await getIt<StorageUtils>().getUserInfo(key: 'token');
    try {
      final result = await dio.get(
        '$baseUrl/all-foods',
        options: Options(
          sendTimeout: const Duration(seconds: 10),
          headers: {'Accept': 'application/json', 'token': token},
        ),
      );

      final List<dynamic> foodData = result.data['food'];
      final individualFoodItem =
          foodData.map((food) => GetAllFoodsModel.fromJson(food)).toList();
      return individualFoodItem;
    } on DioException catch (e) {
      if (e.response != null) {
        final requestMessage = e.response!.data['message'];
        throw RequestException(requestMessage);
      } else {
        //When device is offline
        String? errorMessage = e.message;
        int colonIndex = errorMessage!.indexOf(':');
        String extractedPart =
            "${errorMessage.substring(0, colonIndex).trim()} are you online?";

        throw NetworkException(extractedPart);
      }
    }
  }
}
