import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  const LoginEntity({this.token});
  final String? token;

  @override
  List<Object?> get props => [token];
}
