import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mlosafi/common/presentation/active_order.dart';
import 'package:mlosafi/common/presentation/order_history.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('My Orders'),
            centerTitle: true,
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.factory),
                text: 'Ongoing',
              ),
              Tab(
                icon: Icon(Icons.history),
                text: 'History',
              )
            ]),
          ),
          body: const TabBarView(children: [OngoingOrders(), OrderHistory()]),
        ));
  }
}
