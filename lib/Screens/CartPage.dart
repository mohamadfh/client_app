import 'package:client_app/Notifiers/OrderNotifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:client_app/Screens/OrdersPage.dart';

import 'Navbar.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OrderNotifier orderNotifier = Provider.of<OrderNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Cart'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Navbar()));
              }),
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrdersPage()));
              })
        ],
      ),
      body: orderNotifier.cartList.length == 0
          ? Center(
              child: Text(
                'No Orders! \nAdd some with + icon',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            )
          : Container(
              child: ListView.builder(
                  itemCount: orderNotifier.cartList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: InkWell(
                        child: ListTile(
                          title: Text(
                              orderNotifier.cartList[index].restaurant.name),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    orderNotifier.cartList[index].price
                                        .toString(),
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    orderNotifier.cartList[index].date,
                                    style: TextStyle(
                                      color: Colors.grey[300],
                                      fontSize: 5,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                              Consumer<OrderNotifier>(
                                  builder: (_, notifier, __) => IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () =>
                                            notifier.Remove_Food(index),
                                      )),
                            ],
                          ),
                          leading: Image.asset('assets/food2.jpg'),
                          /*Image.asset(
                                  'assets/${foodNotifier.foodList[index].image}'),*/
                        ),
                      ),
                    );
                  }),
            ),
    );
  }
}
