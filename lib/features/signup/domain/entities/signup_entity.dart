import 'package:equatable/equatable.dart';

class SignUpEntity extends Equatable {
  SignUpEntity({this.id, this.userName, this.email});
  final String? id;
  final String? userName;
  final String? email;

  @override
  List<Object?> get props => [id, userName, email];
}
