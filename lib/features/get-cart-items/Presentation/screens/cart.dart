import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mlosafi/common/reusables/title_text.dart';
import 'package:mlosafi/features/delete-cart-Item/presentation/bloc/delete_cart_item_bloc.dart';
import 'package:mlosafi/features/get-cart-items/Presentation/bloc/cart_data_bloc.dart';

class CartData extends StatefulWidget {
  const CartData({super.key});

  @override
  State<CartData> createState() => _CartDataState();
}

class _CartDataState extends State<CartData> {
  @override
  void initState() {
    super.initState();
    context.read<CartDataBloc>().add(GetCartData());
  }

  @override
  Widget build(BuildContext context) {
    final sizedObject = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.error,
              ))
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5.0, left: 15, right: 15),
        child: ListView(
          children: [
            Stack(
              children: [
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: sizedObject.height * 0.005,
                    ),
                    BlocListener<CartDataBloc, CartDataState>(
                      listener: (context, state) {
                        if (state is CartDataError) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('${state.message}'),
                            backgroundColor:
                                Theme.of(context).colorScheme.error,
                          ));
                        }
                      },
                      child: BlocBuilder<CartDataBloc, CartDataState>(
                        builder: (context, state) {
                          if (state is CartDataLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is CartDataLoaded) {
                            final itemCount =
                                state.cartData.cartObject?.cartItems?.length;
                            final cartData =
                                state.cartData.cartObject?.cartItems;
                            return itemCount == 0
                                ? Center(
                                    child: Text(
                                      'Cart is Empty..Nothing to display.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                          ),
                                    ),
                                  )
                                : Column(
                                    children:
                                        List.generate(itemCount ?? 0, (index) {
                                      return Card(
                                        child: Stack(
                                          children: [
                                            Positioned(
                                                top: 0,
                                                right: 0,
                                                child: IconButton(
                                                    onPressed: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                'Delete Item?',
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headlineSmall
                                                                    ?.copyWith(
                                                                        color: Theme.of(context)
                                                                            .colorScheme
                                                                            .error),
                                                              ),
                                                              content: const Text(
                                                                  'Are you sure?'),
                                                              actions: [
                                                                TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      context
                                                                          .read<
                                                                              DeleteCartItemBloc>()
                                                                          .add(DeleteSingleCartItemEvent(
                                                                              foodId: int.parse(cartData?[index].foodId ?? '')));
                                                                      context
                                                                          .pop();
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                      'Yes',
                                                                    )),
                                                                TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      context
                                                                          .pop();
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                            'No'))
                                                              ],
                                                            );
                                                          });
                                                    },
                                                    icon: const Icon(
                                                        Icons.cancel),
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .error)),
                                            Row(
                                              children: [
                                                Flexible(
                                                    flex: 2,
                                                    child: CachedNetworkImage(
                                                      fit: BoxFit.cover,
                                                      imageUrl:
                                                          '${cartData?[index].imageUrl}',
                                                      height: 100,
                                                      width: 100,
                                                      placeholder:
                                                          (context, url) =>
                                                              const Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                    )),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Flexible(
                                                    child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    TitleText(
                                                        titleText:
                                                            '${cartData?[index].fooodName}'),
                                                    Text(
                                                        'Quantity: ${cartData?[index].quantity}'),
                                                    Text(
                                                        'Ksh: ${cartData?[index].price}'),
                                                  ],
                                                ))
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                  );
                          }
                          return const SizedBox();
                        },
                      ),
                    ),
                    SizedBox(
                      height: sizedObject.height * 0.005,
                    ),
                    BlocListener<DeleteCartItemBloc, DeleteCartItemState>(
                      listener: (context, state) {
                        if (state is DeleteCartItemLoaded) {
                          context.read<CartDataBloc>().add(GetCartData());
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('${state.deletionData}')));
                        }
                        if (state is DeleteCartItemError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${state.errorMessage}'),
                              backgroundColor:
                                  Theme.of(context).colorScheme.error,
                            ),
                          );
                        }
                      },
                      child:
                          BlocBuilder<DeleteCartItemBloc, DeleteCartItemState>(
                              builder: (context, state) {
                        if (state is DeleteCartItemLoading) {
                          return Text(
                            'Removing item from cart...',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    color: Theme.of(context).colorScheme.error),
                          );
                        }

                        return const SizedBox.shrink();
                      }),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: sizedObject.height * 0.01,
            ),
            SizedBox(
              width: sizedObject.width,
              height: sizedObject.height * 0.05,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.monetization_on),
                onPressed: () {
                  context.push('/cart/cart-detail');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                label: Row(
                  children: [
                    const Text(
                      'CHECKOUT  ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    BlocBuilder<CartDataBloc, CartDataState>(
                      builder: (context, state) {
                        if (state is CartDataLoaded) {
                          final totalCartAmount = state.cartData.totalAmount;
                          return Text(
                            '(Ksh $totalCartAmount)',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          );
                        }
                        return const Text('Ksh (0)');
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
