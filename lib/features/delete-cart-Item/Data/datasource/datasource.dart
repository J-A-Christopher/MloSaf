import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mlosafi/common/utils/constants.dart';
import 'package:mlosafi/common/utils/exceptions.dart';
import 'package:mlosafi/common/utils/storage_utils.dart';
import 'package:mlosafi/di/di.dart';
import 'package:mlosafi/features/delete-cart-Item/Data/model/delete-cart_model.dart';

abstract class DeleteCartItem {
  Future<DeletCartItemModelResponse> deleteCrtItem({required int foodId});
}

@Injectable(as: DeleteCartItem)
class DeleteCartItemImpl implements DeleteCartItem {
  @override
  Future<DeletCartItemModelResponse> deleteCrtItem(
      {required int foodId}) async {
    print('foodId:$foodId');
    final dio = Dio();
    final token = await getIt<StorageUtils>().getUserInfo(key: 'token');
    try {
      final result = await dio.delete(
        '$baseUrl/delete-cart-item/$foodId',
        options: Options(
            sendTimeout: const Duration(seconds: 10),
            headers: {'Accept': 'application/json', 'token': token}),
      );
      print('result$result');
      return DeletCartItemModelResponse.fromJson(result.data);
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
