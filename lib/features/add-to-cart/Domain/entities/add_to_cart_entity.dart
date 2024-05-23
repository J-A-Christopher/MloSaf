import 'package:equatable/equatable.dart';

class AddToCartEntity extends Equatable {
  const AddToCartEntity({this.message});
  final String? message;

  @override
  List<Object?> get props => [message];
}
