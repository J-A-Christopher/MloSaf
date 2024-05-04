import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.titleText});
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Text(titleText,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 18));
  }
}
