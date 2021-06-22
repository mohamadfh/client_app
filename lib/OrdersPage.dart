import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ordersPage extends StatefulWidget {
  @override
  _ordersPageState createState() => _ordersPageState();
}

class _ordersPageState extends State<ordersPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
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
                children: [
                  OrderCard()
                ],
              ),
              ListView(
                children: [
                  OrderCard()
                ],
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
