import 'package:dartz/dartz.dart';
import 'package:mlosafi/features/login/Domain/entities/login_entity.dart';

abstract class LoginDomainRepo {
  Future<Either<String, LoginEntity>> loginUser(
      Map<String, dynamic> loginData);
}
