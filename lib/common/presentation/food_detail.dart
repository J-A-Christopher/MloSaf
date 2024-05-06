import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mlosafi/common/reusables/title_text.dart';

class FoodDetail extends StatelessWidget {
  const FoodDetail({super.key});

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
      body: Padding(
        padding: const EdgeInsets.only(top: 5.0, left: 15, right: 15),
        child: ListView(
          children: [
            SizedBox(
              height: sizedObject.height * 0.01,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/Save.png',
                height: sizedObject.height * 0.25,
                width: sizedObject.width,
              ),
            ),
            SizedBox(
              height: sizedObject.height * 0.01,
            ),
            const Chip(
              shape: StadiumBorder(),
              label: Row(
                children: [
                  Icon(Icons.category),
                  SizedBox(
                    width: 10,
                  ),
                  TitleText(titleText: 'Irish Fries'),
                ],
              ),
            ),
            SizedBox(
              height: sizedObject.height * 0.01,
            ),
            const TitleText(titleText: 'Chicken & Chips'),
            SizedBox(
              height: sizedObject.height * 0.01,
            ),
            const IntrinsicWidth(
              child: Text(
                  'Chicken and chips are one of the most delicioso foods you can have. Made from imported rice we mostly like it tasty!'),
            ),
            SizedBox(
              height: sizedObject.height * 0.01,
            ),
            const Row(
              children: [
                TitleText(titleText: 'Star rating:'),
                SizedBox(
                  width: 10,
                ),
                TitleText(titleText: '4.7'),
              ],
            ),
            SizedBox(
              height: sizedObject.height * 0.01,
            ),
            const Row(
              children: [
                TitleText(titleText: 'Size:'),
                SizedBox(
                  width: 10,
                ),
                Chip(shape: StadiumBorder(), label: Text('Small'))
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
                  context.go('/first-route');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                label: const Text('Add to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
