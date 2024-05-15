part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginInLoading extends LoginState {}

class LoginInLoaded extends LoginState {
  const LoginInLoaded({required this.token});
  final LoginEntity token;
}

class LoginInError extends LoginState {
  const LoginInError({required this.errorMessage});
  final String errorMessage;
}
