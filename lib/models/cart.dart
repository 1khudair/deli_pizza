import 'package:deli_pizza/models/item.dart';

import 'orderStatus.dart';

class ItemCart {
  String? orderID = "5020309";
  Status? orderStatus = Status.complete;
  String? orderDate = "Sat, 12 Sep 2020 ";
  String? payDate = "Sat, 12 Sep 2020 ";
  Item item;
  int itemCount;
  double itemPrice;
  ItemCart({
    required this.item,
    required this.itemCount,
    required this.itemPrice,
  });
}
