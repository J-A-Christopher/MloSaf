import 'package:flutter/material.dart';

class OngoingOrders extends StatelessWidget {
  const OngoingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final sizedObject = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 8, right: 8),
      child: Column(
        children: [
          ListTile(
            leading: Image.asset('assets/kuku.png'),
            title: const Text('Pizza hunt'),
            subtitle: const Row(
              children: [
                Text('ksh: 10.50'),
                SizedBox(
                  width: 5,
                ),
                Text('|'),
                SizedBox(
                  width: 5,
                ),
                Text('2 Items'),
              ],
            ),
            trailing: const Text('#12345678'),
          ),
          SizedBox(
            height: sizedObject.height * 0.003,
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: const Text('Cancel Order'),
          )
        ],
      ),
    );
  }
}
