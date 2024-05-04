import 'package:flutter/material.dart';

class ElevatedButtonCustomized extends StatelessWidget {
  const ElevatedButtonCustomized(
      {super.key,
      required this.btnText,
      required this.imagePath,
      required this.func});
  final String btnText;
  final String imagePath;
  final Function func;

  @override
  Widget build(BuildContext context) {
    final sizedObject = MediaQuery.of(context).size;
    return SizedBox(
      width: sizedObject.width * 0.7,
      height: sizedObject.height * 0.05,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: func(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagePath),
              const SizedBox(
                width: 10,
              ),
              Text(btnText)
            ],
          )),
    );
  }
}
