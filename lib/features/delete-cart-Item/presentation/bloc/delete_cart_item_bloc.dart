import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mlosafi/di/di.dart';
import 'package:mlosafi/features/delete-cart-Item/Domain/usecases/delet_item_usecase.dart';

part 'delete_cart_item_event.dart';
part 'delete_cart_item_state.dart';

@injectable
class DeleteCartItemBloc
    extends Bloc<DeleteCartItemEvent, DeleteCartItemState> {
  DeleteCartItemBloc() : super(DeleteCartItemInitial()) {
    on<DeleteSingleCartItemEvent>((event, emit) async {
      emit(DeleteCartItemLoading());
      final deleteItemResponse = await getIt<DeleteCartItemUseCase>()
          .deleteFoodItem(foodId: event.foodId);
      deleteItemResponse
          .fold((failure) => emit(DeleteCartItemError(errorMessage: failure)),
              (deleteItemData) {
        emit(DeleteCartItemLoaded(deletionData: deleteItemData.message ?? ''));
      });
    });
  }
}
