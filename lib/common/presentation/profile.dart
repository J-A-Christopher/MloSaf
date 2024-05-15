import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mlosafi/common/reusables/list_tile_reus.dart';
import 'package:mlosafi/common/reusables/title_text.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final sizedObject = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 15, right: 15),
        child: ListView(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                ),
                SizedBox(
                  width: 20,
                ),
                TitleText(titleText: 'Septa')
              ],
            ),
            SizedBox(
              height: sizedObject.height * 0.01,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    ListTileReusable(
                        leadingIcon: const Icon(Icons.person),
                        title: 'Personal Info',
                        trailingIconButton: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios))),
                    ListTileReusable(
                        leadingIcon: const Icon(Icons.location_city),
                        title: 'Addresses',
                        trailingIconButton: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios))),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: sizedObject.height * 0.01,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    ListTileReusable(
                        leadingIcon: const Icon(Icons.shopping_bag),
                        title: 'Cart',
                        trailingIconButton: IconButton(
                            onPressed: () {
                              context.push('/cart');
                            },
                            icon: const Icon(Icons.arrow_forward_ios))),
                    ListTileReusable(
                        leadingIcon: const Icon(Icons.favorite),
                        title: 'Favorite',
                        trailingIconButton: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios))),
                    ListTileReusable(
                        leadingIcon: const Icon(Icons.notifications),
                        title: 'Notifications',
                        trailingIconButton: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios))),
                    ListTileReusable(
                        leadingIcon: const Icon(Icons.wallet),
                        title: 'Payment Method',
                        trailingIconButton: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios))),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: sizedObject.height * 0.01,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    ListTileReusable(
                        leadingIcon: const Icon(Icons.question_answer),
                        title: 'FAQs',
                        trailingIconButton: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios))),
                    ListTileReusable(
                        leadingIcon: const Icon(Icons.reviews),
                        title: 'User Reviews',
                        trailingIconButton: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios))),
                    ListTileReusable(
                        leadingIcon: const Icon(Icons.settings),
                        title: 'Settings',
                        trailingIconButton: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios))),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: sizedObject.height * 0.01,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    ListTileReusable(
                        leadingIcon: const Icon(Icons.logout),
                        title: 'Log Out',
                        trailingIconButton: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios))),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: sizedObject.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
