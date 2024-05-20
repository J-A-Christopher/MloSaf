import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mlosafi/di/di.dart';
import 'package:mlosafi/features/login/Domain/usecases/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginUser>((event, emit) async {
      final loginUseCases = getIt<LoginUseCase>();
      emit(LoginInLoading());
      final loginData = await loginUseCases.loginEntity(event.loginData);
      loginData.fold((failure) => emit(LoginInError(errorMessage: failure)),
          (loginResponse) {
        emit(LoginInLoaded(token: loginResponse.token));
      });
    });
  }
}
