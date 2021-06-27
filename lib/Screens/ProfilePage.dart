import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text("FNAME LNAME"),
              ),
            ),
            Divider(),
            Card(
              child: ListTile(
                leading: Icon(Icons.money),
                title: Text("CREDIT : \$\$\$"),
              ),
            ),
            Divider(),
            Card(
              child: ListTile(
                leading: Icon(Icons.comment),
                title: Text("Comments"),
              ),
            ),
            Divider(),
            Card(
              child: ListTile(
                leading: Icon(Icons.star),
                title: Text("FAVORITES"),
              ),
            ),
            Divider(),
            Card(
              child: ListTile(
                leading: Icon(Icons.money),
                title: Text("CREDIT : \$\$\$"),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
