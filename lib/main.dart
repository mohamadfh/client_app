import 'package:client_app/Notifiers/OrderNotifier.dart';
import 'package:flutter/material.dart';
import 'package:client_app/Screens/LoginPage.dart';
import 'package:client_app/Screens/Register.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => OrderNotifier())
    ], child: MaterialApp(debugShowCheckedModeBanner: false, home: MyApp())),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Welcome to client App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
            child: Column(
          children: [
            Image.asset(
              'assets/logo.jpg',
              width: 600,
              height: 350,
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 260,
              height: 80,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text(
                  'Login',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  onPrimary: Colors.orange,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 260,
              height: 80,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  onPrimary: Colors.orange,
                ),
              ),
            )
          ],
        )),
      )),
    );
  }
}
