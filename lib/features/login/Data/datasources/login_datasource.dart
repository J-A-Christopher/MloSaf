import 'package:dio/dio.dart';
import 'package:mlosafi/common/utils/exceptions.dart';
import 'package:mlosafi/features/login/Data/model/login_response.dart';

abstract class LoginDataSource {
  Future<LoginResponse> loginUser(Map<String, dynamic> loginData);
}

class LoginDataSourceImpl implements LoginDataSource {
  @override
  Future<LoginResponse> loginUser(Map<String, dynamic> loginData) async {
    final dio = Dio();

    final result =
        await dio.post('http://192.168.246.96:3000/login', data: loginData);

    if (result.statusCode == 201) {
      return LoginResponse.fromJson(result.data);
    } else {
      throw ServerException();
    }
  }
}
