part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class OnSignUp extends SignUpEvent {
  const OnSignUp({required this.signUpData});
  final Map<String, dynamic> signUpData;
}
