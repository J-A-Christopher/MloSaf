import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mlosafi/di/di.dart';
import 'package:mlosafi/features/signup/domain/entities/signup_entity.dart';
import 'package:mlosafi/features/signup/domain/usecases/signup_usecase.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<OnSignUp>((event, emit) async {
      {
        emit(SignUpLoading());
        final signUpUseCase =
            await getIt<SignUpUseCase>().signUpUseCase(event.signUpData);

        signUpUseCase.fold(
            (failure) => emit(SignUpError(errorMessage: failure)),
            (signUpResponse) => emit(SignUpLoaded(userData: signUpResponse)));
      }
    });
  }
}
