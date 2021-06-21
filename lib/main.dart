
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          ordersPage(),
          Placeholder(color: Colors.blue),
          Placeholder(color: Colors.red),
          Placeholder(color: Colors.yellow,)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
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
              Placeholder(color: Colors.red)
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
              leading: Icon(Icons.restaurant),
              title: Text('Restaurant name'),
              subtitle: Text("TEST")
          ),
          TextButton(
            child: const Text('Reorder'),
            onPressed: () {/* DO SOMETHING */},
          ),
        ],
      ),
    );
  }
}
