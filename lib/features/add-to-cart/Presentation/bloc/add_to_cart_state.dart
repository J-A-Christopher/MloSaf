part of 'add_to_cart_bloc.dart';

abstract class AddToCartState extends Equatable {
  const AddToCartState();

  @override
  List<Object> get props => [];
}

class AddToCartInitial extends AddToCartState {}

class AddToCartLoading extends AddToCartState {}

class AddToCartLoaded extends AddToCartState {
  const AddToCartLoaded({required this.cartMessage});
   final String? cartMessage;
}

class AddToCartError extends AddToCartState {
  const AddToCartError({required this.errorMessage});
  final String? errorMessage;
}
