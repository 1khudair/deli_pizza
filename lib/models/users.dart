import 'package:deli_pizza/models/cart.dart';


class Users {
  String urlImage;
  String? userName;
  String? userPhone;
  String? userEmail;
  List<ItemCart> basket = [
    
  ];
  Users(
      {required this.urlImage,
      this.userName,
      this.userPhone,
      this.userEmail,
      required this.basket});
}
