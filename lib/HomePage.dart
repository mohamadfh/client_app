import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Text("CATEGORY1"),
          Divider(),
          Expanded(child:SizedBox(
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
      );
  }
}

class RestaurantCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:     Card(
      color: Colors.red,
      borderOnForeground: true,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.ac_unit),
            title:Text("WELL"),
          ),
          Text("RES NAME"),
          Text("IMAGE")
        ],
      ),
    ),
    );
  }
}
