import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mlosafi/common/reusables/title_text.dart';
import 'package:badges/badges.dart' as badges;
import 'package:mlosafi/common/utils/storage_utils.dart';
import 'package:mlosafi/di/di.dart';
import 'package:mlosafi/features/get-all-foods/Presentation/bloc/get_all_foods_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FirstRoute extends StatefulWidget {
  const FirstRoute({super.key});

  @override
  State<FirstRoute> createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  bool _showGridView = false;

  @override
  void initState() {
    super.initState();
    context.read<GetAllFoodsBloc>().add(GetAllFoods());
    _loadUsername();
  }

  String _username = '';

  Future<void> _loadUsername() async {
    final username = await getIt<StorageUtils>().getUserInfo(key: 'username');
    setState(() {
      _username = username ?? '';
    });
  }

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
                      Text(
                          'Hello ${_username.isNotEmpty ? _username : 'friend'},'),
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
                          child:
                              BlocListener<GetAllFoodsBloc, GetAllFoodsState>(
                            listener: (context, state) {
                              if (state is GetAllFoodsError) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      state.errorMessage,
                                    ),
                                    backgroundColor:
                                        Theme.of(context).colorScheme.error,
                                  ),
                                );
                              }
                            },
                            child:
                                BlocBuilder<GetAllFoodsBloc, GetAllFoodsState>(
                              builder: (context, state) {
                                if (state is GetAllFoodsLoaded) {
                                  return Row(
                                    children: List.generate(4, (index) {
                                      final imageUrl =
                                          state.foodData[index].imageUrl;
                                      final foodName =
                                          state.foodData[index].foodName;
                                      final starRating =
                                          state.foodData[index].starRating;
                                      final foodPrice =
                                          state.foodData[index].price;
                                      return Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(10),
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                        bottomRight:
                                                            Radius.circular(
                                                                10)),
                                                child: CachedNetworkImage(
                                                  imageUrl: '$imageUrl',
                                                  height: 100,
                                                  width: 100,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Text(
                                                '$foodName',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge
                                                    ?.copyWith(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                      'Star rating: $starRating'),
                                                  const SizedBox(
                                                    width: 35,
                                                  ),
                                                  Text('ksh: $foodPrice')
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                  );
                                }
                                if (state is GetAllFoodsLoading) {
                                  // return const CircularProgressIndicator();
                                  return Skeletonizer(
                                    enabled: true,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: List.generate(4, (index) {
                                          return const SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: Card(),
                                          );
                                        }),
                                      ),
                                    ),
                                  );
                                }
                                return const SizedBox();
                              },
                            ),
                          ),
                        )
                      : BlocBuilder<GetAllFoodsBloc, GetAllFoodsState>(
                          builder: (context, state) {
                          if (state is GetAllFoodsLoaded) {
                            final itemCount = state.foodData.length;
                            return GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.8,
                                  crossAxisSpacing: 16.0,
                                  mainAxisSpacing: 16.0,
                                ),
                                itemCount: itemCount,
                                itemBuilder: (context, index) {
                                  final imageUrl =
                                      state.foodData[index].imageUrl;
                                  final foodName =
                                      state.foodData[index].foodName;
                                  final starRating =
                                      state.foodData[index].starRating;
                                  final foodPrice = state.foodData[index].price;
                                  return Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius: const BorderRadius
                                                .only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10)),
                                            child: CachedNetworkImage(
                                              placeholder: (context, url) =>
                                                  const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                              errorListener: (value) => Center(
                                                child: Center(
                                                  child: Icon(
                                                    Icons.error,
                                                    size: 25,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .error,
                                                  ),
                                                ),
                                              ),
                                              imageUrl: '$imageUrl',
                                              height: 100,
                                              width: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Text(
                                            '$foodName',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge
                                                ?.copyWith(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                      'Star rating: $starRating')),
                                              const SizedBox(
                                                width: 35,
                                              ),
                                              Text('ksh: $foodPrice')
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          }
                          return const SizedBox();
                        }),
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
