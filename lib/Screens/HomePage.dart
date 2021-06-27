import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:client_app/Screens/Navbar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Navbar()));
              })
        ],
        title: Text(
          'Home page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Text("CATEGORY1"),
          Divider(),
          Expanded(
            child: SizedBox(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Text("TEST"),
                  Text("TEST"),
                  Text("TEST"),
                  Text("TEST"),
                  Text("TEST"),
                  Text("TEST"),
                  Text("TEST"),
                  Text("TEST"),
                  Text("TEST"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        color: Colors.red,
        borderOnForeground: true,
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text("WELL"),
            ),
            Text("RES NAME"),
            Text("IMAGE")
          ],
        ),
      ),
    );
  }
}
