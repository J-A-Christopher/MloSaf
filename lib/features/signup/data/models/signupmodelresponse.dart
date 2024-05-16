import 'package:equatable/equatable.dart';
import 'package:mlosafi/features/signup/domain/entities/signup_entity.dart';

class SignUpModelResponse extends SignUpEntity with EquatableMixin {
  SignUpModelResponse(this.id, this.userName, this.email);
  @override
  final String id;
  @override
  final String userName;
  @override
  final String email;

  factory SignUpModelResponse.fromJson(Map<String, dynamic> data) {
    return SignUpModelResponse(data['id'], data['username'], data['email']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'username': userName, 'email': email};
  }
}
