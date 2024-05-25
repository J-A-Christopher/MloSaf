import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mlosafi/common/reusables/title_text.dart';
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
                            return Column(
                              children: List.generate(itemCount ?? 0, (index) {
                                return Card(
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          top: 0,
                                          right: 0,
                                          child: IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons.cancel),
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
                                                placeholder: (context, url) =>
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
                                                  'Ksh: ${cartData?[index].price}')
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
                  ],
                ),
              ],
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Row(
                        children: [
                          const Text('Delivery Address'),
                          const Spacer(),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'EDIT',
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: sizedObject.height * 0.008,
                    ),
                    const Text('Emerald Apartments Room 17'),
                    SizedBox(
                      height: sizedObject.height * 0.02,
                    ),
                    Row(
                      children: [
                        const Text('TOTAL:'),
                        const Spacer(),
                        BlocBuilder<CartDataBloc, CartDataState>(
                          builder: (context, state) {
                            if (state is CartDataLoading) {
                              return const Expanded(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                            if (state is CartDataLoaded) {
                              final total = state.cartData.totalAmount;

                              return TitleText(titleText: 'Ksh: $total');
                            }
                            return const SizedBox();
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: sizedObject.height * 0.03,
                    ),
                    SizedBox(
                      width: sizedObject.width,
                      height: sizedObject.height * 0.05,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.card_travel),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        label: const Text('PLACE ORDER'),
                      ),
                    ),
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
