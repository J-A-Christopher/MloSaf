import 'package:dartz/dartz.dart';
import 'package:mlosafi/features/signup/domain/entities/signup_entity.dart';

abstract class SignUpDomainRepo {
  Future<Either<String, SignUpEntity>> signUpUser(
      Map<String, dynamic> signUpData);
}
