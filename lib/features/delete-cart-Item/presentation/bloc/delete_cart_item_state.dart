part of 'delete_cart_item_bloc.dart';

abstract class DeleteCartItemState extends Equatable {
  const DeleteCartItemState();

  @override
  List<Object> get props => [];
}

class DeleteCartItemInitial extends DeleteCartItemState {}

class DeleteCartItemLoading extends DeleteCartItemState {}

class DeleteCartItemLoaded extends DeleteCartItemState {
  const DeleteCartItemLoaded({required this.deletionData});
  final String? deletionData;
}

class DeleteCartItemError extends DeleteCartItemState {
  const DeleteCartItemError({required this.errorMessage});
  final String? errorMessage;
}
