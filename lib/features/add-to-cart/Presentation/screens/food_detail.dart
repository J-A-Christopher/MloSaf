import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mlosafi/common/reusables/title_text.dart';
import 'package:mlosafi/features/add-to-cart/Presentation/bloc/add_to_cart_bloc.dart';
import 'package:mlosafi/features/get-all-foods/Presentation/bloc/get_all_foods_bloc.dart';
import 'package:mlosafi/features/get-cart-items/Presentation/bloc/cart_data_bloc.dart';

class FoodDetail extends StatelessWidget {
  const FoodDetail({super.key, required this.selectedId});
  final String selectedId;

  @override
  Widget build(BuildContext context) {
    final sizedObject = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: CircleAvatar(
            child: Center(
              child: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
          ),
        ),
      ),
      body: BlocBuilder<GetAllFoodsBloc, GetAllFoodsState>(
        builder: (context, state) {
          if (state is GetAllFoodsLoaded) {
            final selectedFoodData = state.foodData
                .firstWhere((foodData) => foodData.foodId == selectedId);
            return Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 15, right: 15),
              child: ListView(
                children: [
                  SizedBox(
                    height: sizedObject.height * 0.01,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: CachedNetworkImage(
                      imageUrl: '${selectedFoodData.imageUrl}',
                      height: sizedObject.height * 0.25,
                      width: sizedObject.width,
                    ),
                  ),
                  SizedBox(
                    height: sizedObject.height * 0.01,
                  ),
                  Chip(
                    shape: const StadiumBorder(),
                    label: Row(
                      children: [
                        const Icon(Icons.category),
                        const SizedBox(
                          width: 10,
                        ),
                        TitleText(
                            titleText: '${selectedFoodData.category?.name}'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: sizedObject.height * 0.01,
                  ),
                  TitleText(titleText: '${selectedFoodData.foodName}'),
                  SizedBox(
                    height: sizedObject.height * 0.01,
                  ),
                  IntrinsicWidth(
                    child: Text('${selectedFoodData.description}'),
                  ),
                  SizedBox(
                    height: sizedObject.height * 0.01,
                  ),
                  Row(
                    children: [
                      const TitleText(titleText: 'Star rating:'),
                      const SizedBox(
                        width: 10,
                      ),
                      TitleText(titleText: '${selectedFoodData.starRating}'),
                    ],
                  ),
                  SizedBox(
                    height: sizedObject.height * 0.01,
                  ),
                  Row(
                    children: [
                      const TitleText(titleText: 'Size:'),
                      const SizedBox(
                        width: 10,
                      ),
                      Chip(
                          shape: const StadiumBorder(),
                          label: Text('${selectedFoodData.subCategory?.size}'))
                    ],
                  ),
                  SizedBox(
                    height: sizedObject.height * 0.04,
                  ),
                  SizedBox(
                    width: sizedObject.width * 0.7,
                    height: sizedObject.height * 0.05,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.shopping_bag),
                      onPressed: () {
                        context
                            .read<AddToCartBloc>()
                            .add(AddItemToCart(foodId: selectedId));
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      label: const Text('Add to Cart'),
                    ),
                  ),
                  SizedBox(
                    height: sizedObject.height * 0.04,
                  ),
                  BlocListener<AddToCartBloc, AddToCartState>(
                    listener: (context, state) {
                      if (state is AddToCartLoaded) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${state.cartMessage}')));
                        context.go('/first-route');
                        context.read<CartDataBloc>().add(GetCartData());
                      }
                      if (state is AddToCartError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${state.errorMessage}'),
                            backgroundColor:
                                Theme.of(context).colorScheme.error,
                          ),
                        );
                      }
                    },
                    child: BlocBuilder<AddToCartBloc, AddToCartState>(
                        builder: (context, state) {
                      if (state is AddToCartLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return const SizedBox();
                    }),
                  )
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
