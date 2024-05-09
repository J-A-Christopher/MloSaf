import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mlosafi/common/reusables/title_text.dart';
import 'package:badges/badges.dart' as badges;

class FirstRoute extends StatefulWidget {
  const FirstRoute({super.key});

  @override
  State<FirstRoute> createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  bool _showGridView = false;
  @override
  Widget build(BuildContext context) {
    final sizedObject = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
                top: 6,
                right: 16.0,
                child: InkWell(
                  onTap: () {
                    context.push('/cart');
                  },
                  child: badges.Badge(
                    badgeContent: const Text('3'),
                    badgeStyle: badges.BadgeStyle(
                        badgeColor: Theme.of(context).colorScheme.primary),
                    child: const Icon(Icons.shopping_cart),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 15, right: 15),
              child: ListView(
                children: [
                  Row(
                    children: [
                      const Text('Hey Septa, '),
                      Text(
                        'Good Afternoon !',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: sizedObject.height * 0.01,
                  ),
                  TextField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(5),
                          filled: true,
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'What will you like to eat?',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontSize: 15))),
                  SizedBox(
                    height: sizedObject.height * 0.02,
                  ),
                  Row(
                    children: [
                      const Expanded(
                          child: TitleText(titleText: 'All Categories.')),
                      const Spacer(),
                      TextButton.icon(
                          onPressed: () {
                            setState(() {
                              _showGridView = !_showGridView;
                            });
                          },
                          icon: const Icon(Icons.arrow_forward_ios),
                          label: const Text('See All'))
                    ],
                  ),
                  SizedBox(
                    height: sizedObject.height * 0.01,
                  ),
                  !_showGridView
                      ? SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  context.push('/first-route/food-detail');
                                },
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/pizza.png',
                                          height: 100,
                                          width: 100,
                                        ),
                                        Text(
                                          'Pizza',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge
                                              ?.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text('Starting'),
                                            SizedBox(
                                              width: 35,
                                            ),
                                            Text('ksh: 70')
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/burger.png',
                                        height: 100,
                                        width: 100,
                                      ),
                                      Text(
                                        'Burger',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                      ),
                                      const Row(
                                        children: [
                                          Text('Starting'),
                                          SizedBox(
                                            width: 35,
                                          ),
                                          Text('ksh: 50')
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/smokie.png',
                                        height: 100,
                                        width: 100,
                                      ),
                                      Text(
                                        'Pizza',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                      ),
                                      const Row(
                                        children: [
                                          Text('Starting'),
                                          SizedBox(
                                            width: 35,
                                          ),
                                          Text('ksh: 35')
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/burger.png',
                                        height: 100,
                                        width: 100,
                                      ),
                                      Text(
                                        'Burger',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                      ),
                                      const Row(
                                        children: [
                                          Text('Starting'),
                                          SizedBox(
                                            width: 35,
                                          ),
                                          Text('ksh: 50')
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8,
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 16.0,
                          ),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 25),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/burger.png',
                                      height: 100,
                                      width: 100,
                                    ),
                                    Text(
                                      'Smokin Burger',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                    ),
                                    const Text('Australian'),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    const Text('ksh: 70')
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                  SizedBox(
                    height: sizedObject.height * 0.01,
                  ),
                  const TitleText(titleText: 'Suggested Restaurants'),
                  SizedBox(
                    height: sizedObject.height * 0.01,
                  ),
                  const Divider(),
                  ListTile(
                    leading: Image.asset('assets/obra.png'),
                    title: const Text('Obra Restaurant'),
                    subtitle: const Row(
                      children: [
                        Icon(Icons.star),
                        SizedBox(
                          width: 5,
                        ),
                        Text('4.7')
                      ],
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: Image.asset('assets/megab.png'),
                    title: const Text('Megabytes Restaurant'),
                    subtitle: const Row(
                      children: [
                        Icon(Icons.star),
                        SizedBox(
                          width: 5,
                        ),
                        Text('3.7')
                      ],
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: Image.asset('assets/ray.png'),
                    title: const Text('Ray Restaurant'),
                    subtitle: const Row(
                      children: [
                        Icon(Icons.star),
                        SizedBox(
                          width: 5,
                        ),
                        Text('2.5')
                      ],
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: sizedObject.height * 0.01,
                  ),
                  const TitleText(titleText: 'Popular Fast Foods'),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/pizza.png',
                                    height: 100,
                                    width: 100,
                                  ),
                                  Text(
                                    'Buffallo Pizza',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  const Text('Fratelli Figorito'),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/pizza.png',
                                    height: 100,
                                    width: 100,
                                  ),
                                  Text(
                                    'Buffallo Pizza',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  const Text('Fratelli Figorito'),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/pizza.png',
                                    height: 100,
                                    width: 100,
                                  ),
                                  Text(
                                    'European Pizza',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  const Text('Peppe Pizza'),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/pizza.png',
                                    height: 100,
                                    width: 100,
                                  ),
                                  Text(
                                    'European Pizza',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  const Text('Peppe Pizza'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: sizedObject.height * 0.03,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
