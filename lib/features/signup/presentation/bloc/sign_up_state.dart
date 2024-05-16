part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpLoaded extends SignUpState {
  const SignUpLoaded({required this.userData});
  final SignUpEntity userData;
}

class SignUpError extends SignUpState {
  const SignUpError({required this.errorMessage});
  final String errorMessage;
}
