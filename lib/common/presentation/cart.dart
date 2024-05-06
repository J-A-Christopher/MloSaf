import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mlosafi/common/reusables/title_text.dart';

class CartData extends StatelessWidget {
  const CartData({super.key});

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
                color: Theme.of(context).colorScheme.secondary,
              ))
        ],
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 15, right: 15),
            child: ListView(
              children: [
                SizedBox(
                  height: sizedObject.height * 0.005,
                ),
                Card(
                  child: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.cancel),
                              color: Theme.of(context).colorScheme.error)),
                      Row(
                        children: [
                          Flexible(
                            flex: 2,
                            child: Image.asset(
                              'assets/Save.png',
                              height: 100,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Flexible(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleText(titleText: 'Pizza European'),
                              Text('Star Rating: 4'),
                              Text('Size: Medium'),
                              Text('Quantity: 1'),
                              Text('Ksh:64')
                            ],
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: sizedObject.height * 0.005,
                ),
                Card(
                  child: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.cancel),
                              color: Theme.of(context).colorScheme.error)),
                      Row(
                        children: [
                          Flexible(
                            flex: 2,
                            child: Image.asset(
                              'assets/Save.png',
                              height: 100,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Flexible(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleText(titleText: 'Pizza European'),
                              Text('Star Rating: 4'),
                              Text('Size: Medium'),
                              Text('Quantity: 1'),
                              Text('Ksh:64')
                            ],
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: sizedObject.height * 0.005,
                ),
                Card(
                  child: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.cancel),
                              color: Theme.of(context).colorScheme.error)),
                      Row(
                        children: [
                          Flexible(
                            flex: 2,
                            child: Image.asset(
                              'assets/Save.png',
                              height: 100,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Flexible(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleText(titleText: 'Pizza European'),
                              Text('Star Rating: 4'),
                              Text('Size: Medium'),
                              Text('Quantity: 1'),
                              Text('Ksh:64')
                            ],
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              child: SizedBox(
                width: sizedObject.width,
                height: sizedObject.height * 0.25,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
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
                        SizedBox(
                          height: sizedObject.height * 0.008,
                        ),
                        const Text('Emerald Apartments Room 17'),
                        SizedBox(
                          height: sizedObject.height * 0.02,
                        ),
                        const Row(
                          children: [
                            Text('TOTAL:'),
                            Spacer(),
                            TitleText(titleText: 'Ksh96')
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
              ))
        ],
      ),
    );
  }
}
