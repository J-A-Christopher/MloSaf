import 'package:equatable/equatable.dart';

class DeleteCartEntity extends Equatable {
  const DeleteCartEntity({this.message});
  final String? message;
  @override
  List<Object?> get props => [message];
}
