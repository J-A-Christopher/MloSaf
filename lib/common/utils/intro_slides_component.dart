import 'package:flutter/material.dart';

class IntroSlidesComponent extends StatelessWidget {
  const IntroSlidesComponent(
      {super.key,
      required this.assetImagePath,
      required this.titleText,
      required this.description});
  final String assetImagePath;
  final String titleText;
  final String description;

  @override
  Widget build(BuildContext context) {
    final sizeObject = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 70.0, left: 15, right: 15),
      child: Column(
        children: [
          Image.asset(assetImagePath),
          SizedBox(
            height: sizeObject.height * 0.01,
          ),
          SizedBox(
            height: sizeObject.height * 0.02,
          ),
          Text(
            titleText,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(
            height: sizeObject.height * 0.02,
          ),
          IntrinsicWidth(
            child: Text(description),
          ),
        ],
      ),
    );
  }
}
