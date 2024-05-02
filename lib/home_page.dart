import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mlosafi'),
        ),
        body: ElevatedButton(
          onPressed: () {
            //Navigator.pushNamed(context, '/second');
          },
          child: const Text('Go to second page'),
        ));
  }
}
