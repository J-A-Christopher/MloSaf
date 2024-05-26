part of 'delete_cart_item_bloc.dart';

abstract class DeleteCartItemEvent extends Equatable {
  const DeleteCartItemEvent();

  @override
  List<Object> get props => [];
}

class DeleteSingleCartItemEvent extends DeleteCartItemEvent {
  const DeleteSingleCartItemEvent({required this.foodId});
  final int foodId;
}
