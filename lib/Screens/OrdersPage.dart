import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Navbar.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TabBar(
                  tabs: [
                    Tab(
                      text: 'Active',
                    ),
                    Tab(
                      text: 'History',
                    ),
                  ],
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListView(
                children: [OrderCard()],
              ),
              ListView(
                children: [OrderCard()],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.restaurant),
            title: Text("RESTAURANT NAME"),
          ),
          Text("PRICE"),
          Text("ADDRESS"),
          Text("ITEMS"),
          Text("DATE"),
          TextButton(
            child: const Text('Reorder'),
            onPressed: () {/* DO SOMETHING */},
          ),
        ],
      ),
    );
  }
}
