import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'dart:typed_data';

class ActiveOrder{
  int id;
  Restaurant restaurant;
  String address;
  int price;
  String date;
  List items;
  ActiveOrder(this.restaurant,this.address, this.price, this.date, this.items,this.id);
}
class InactiveOrder{
  Restaurant restaurant;
  String address;
  int price;
  String date;
  List items;
  InactiveOrder(this.restaurant,this.address, this.price, this.date, this.items);
}

class Restaurant{
  List comments;
  List menu;
  String address;
  String name;
  Restaurant(this.menu, this.address, this.name);
}
class FoodItem{
  bool isReady;
  String picture;
  String name;
  String description;
  int price;
  FoodItem(this.name, this.price,this.picture,this.description,this.isReady);
}
class Comment{
  String comment;
  String answer;
}
class User{
  List comments;
  List favs;
  String fname;
  String lname;
  int credit;
  List carts;
  List activeOrders;
  List orderHistory;

}
class Database{
  User user;

}
enum Category{
  fastFood,
  casual,
  fineDining
}
class database{
  User user;
  Map restaurants;
}
class controller{
  static Future<String> request(String req) async{
    await Socket.connect("192.168.1.104", 5457).then((socket) {
      socket.writeln(req);
      socket.flush();
      socket.listen((data) {
        String res = utf8.decode(data);
        print(res);
        return res;
      },
          onDone: () {
            print("Done");
            socket.destroy();
          });
    });
  }
}