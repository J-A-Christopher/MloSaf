import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mlosafi/di/di.dart';
import 'package:mlosafi/features/signup/domain/entities/signup_entity.dart';
import 'package:mlosafi/features/signup/domain/repository/signup_domrepo.dart';

@injectable
class SignUpUseCase {
  Future<Either<String, SignUpEntity>> signUpUseCase(
      Map<String, dynamic> signUpData) async {
    final signUpUser = await getIt<SignUpDomainRepo>().signUpUser(signUpData);
    return signUpUser;
  }
}
