class Order{
  Restaurant restaurant;
  String address;
  int price;
  String date;
  List items;
  Order(this.restaurant,this.address, this.price, this.date, this.items);
}
class Restaurant{
  List menu;
  String address;
  String name;
  Restaurant(this.menu, this.address, this.name);
}
