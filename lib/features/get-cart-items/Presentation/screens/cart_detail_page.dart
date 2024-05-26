import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mlosafi/features/get-cart-items/Presentation/bloc/cart_data_bloc.dart';

class CartDetailPage extends StatefulWidget {
  const CartDetailPage({super.key});

  @override
  State<CartDetailPage> createState() => _CartDetailPageState();
}

class _CartDetailPageState extends State<CartDetailPage> {
  @override
  Widget build(BuildContext context) {
    final sizedObject = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Place your order'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5.0, left: 15, right: 15),
        child: ListView(
          children: [
            BlocBuilder<CartDataBloc, CartDataState>(
              builder: (context, state) {
                if (state is CartDataLoaded) {
                  final itemCount =
                      state.cartData.cartObject?.cartItems?.length;
                  final itemPrice = state.cartData.totalAmount;
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Item\'s total ( $itemCount )',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              Text(
                                'KSH $itemPrice',
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic),
                              )
                            ],
                          ),
                          SizedBox(
                            height: sizedObject.height * 0.005,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Total',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              Text(
                                'KSH $itemPrice',
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
            const Text(
              'PAYMENT METHOD',
              style: TextStyle(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
            ),
            const ListTile(
              leading: Icon(Icons.payment),
              title: Text('Pay on delivery with Mobile Money'),
            ),
            Row(
              children: [
                const Text('ADDRESS'),
                const Spacer(),
                TextButton(
                    onPressed: () {}, child: const Text('CHANGE YOUR ADDRESS'))
              ],
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Christopher Jesse'),
                    SizedBox(
                      height: sizedObject.height * 0.005,
                    ),
                    const Text('P.O Box 3900-30100 Eldoret')
                  ],
                ),
              ),
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
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                label: const Text('CONFIRM ORDER'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
