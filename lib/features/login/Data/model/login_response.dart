import 'package:equatable/equatable.dart';
import 'package:mlosafi/features/login/Domain/entities/login_entity.dart';

class LoginResponse extends LoginEntity with EquatableMixin {
  LoginResponse({this.token});
  final String? token;

  factory LoginResponse.fromJson(Map<String, dynamic> data) {
    return LoginResponse(token: data['token']);
  }
}
