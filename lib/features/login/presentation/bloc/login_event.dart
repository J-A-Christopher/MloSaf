part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUser extends LoginEvent {
  const LoginUser({required this.loginData});
  final Map<String, dynamic> loginData;
}
