import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mlosafi/common/utils/constants.dart';
import 'package:mlosafi/common/utils/exceptions.dart';
import 'package:mlosafi/common/utils/storage_utils.dart';
import 'package:mlosafi/di/di.dart';
import 'package:mlosafi/features/add-to-cart/Data/models/add_to_cart_model.dart';

abstract class AddToCart {
  Future<AddToCartResponse> addToCart({required String foodId});
}

@Injectable(as: AddToCart)
class AddToCartImpl implements AddToCart {
  @override
  Future<AddToCartResponse> addToCart({required String foodId}) async {
    final dio = Dio();
    final token = await getIt<StorageUtils>().getUserInfo(key: 'token');
    try {
      final result = await dio.post(
        '$baseUrl/add-to-cart/$foodId',
        options: Options(
            sendTimeout: const Duration(seconds: 10),
            headers: {'Accept': 'application/json', 'token': token}),
      );
      return AddToCartResponse.fromJson(result.data);
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
