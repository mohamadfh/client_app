import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
          children: [
            CartCard(),
            CartCard(),
          ],
        )
    );
  }
}
class CartCard extends StatefulWidget {
  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
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
          Row(
            children: [
              Spacer(),
              TextButton(
                child: const Text('Continue'),
                onPressed: () {/* DO SOMETHING */},
              ),
              Spacer(),
              TextButton(
                child: const Text('Delete'),
                onPressed: () {/* DO SOMETHING */},
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
