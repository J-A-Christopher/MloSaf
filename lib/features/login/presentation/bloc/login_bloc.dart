import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mlosafi/common/utils/failures.dart';
import 'package:mlosafi/features/login/Domain/entities/login_entity.dart';
import 'package:mlosafi/features/login/Domain/usecases/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    String mapFailureToMessage(Failure failure) {
      switch (failure.runtimeType) {
        case ServerFailure:
          return 'OOps Server Failure. Try Again Later..';

        case GeneralFailure:
          return 'Something went wrong... Are you online';

        default:
          return 'Something went wrong... Are you online?';
      }
    }

    on<LoginUser>((event, emit) async {
      final loginUseCases = LoginUseCase();
      emit(LoginInLoading());
      final loginData = await loginUseCases.loginEntity(event.loginData);
      loginData.fold(
          (failure) =>
              emit(LoginInError(errorMessage: mapFailureToMessage(failure))),
          (loginResponse) => emit(LoginInLoaded(token: loginResponse)));
    });
  }
}
