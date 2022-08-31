import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deli_pizza/models/address.dart';
import 'package:deli_pizza/models/cart.dart';
import 'package:deli_pizza/models/category.dart';
import 'package:deli_pizza/models/choices.dart';
import 'package:deli_pizza/models/notification.dart';
import 'package:deli_pizza/models/orderCategories.dart';
import 'package:deli_pizza/models/orderStatus.dart';
import 'package:deli_pizza/models/users.dart';
import 'package:deli_pizza/share/data/dummy.dart';
import 'package:flutter/material.dart';

import 'item.dart';

class DataProvider extends ChangeNotifier {
  int? receptType;

  var db = FirebaseFirestore.instance;

  List<Address> addresses = [];
  List<Item> items = [];
  List<Item> getItems() {
    return items;
  }

  List<Address> getAddress() {
    return addresses;
  }

  Future<void> addAddressToStore(Address address) async {
    await db.collection("addresses").add(address.toMap());
  }

  Future<void> addItemTostore(Item item) async {
    await db.collection("items").add(item.toMap());
  }

  getItemsFromStore() async {
    items.clear();

    db.collection("items").get().then((document) {
      for (var item in document.docs) {
        items.add(Item(
          itemId: item['itemId'],
          itemImage: item['itemImage'],
          itemName: item['itemName'],
          itemPrice: item['itemPrice'],
          isFavorite: item['isFavorite'],
          itemCategories: item['itemCategories'],
          itemDiscription: item['itemDiscription'],
          itemDiscount: item['itemDiscount'],
        ));
        notifyListeners();
      }
    });
  }

  getAddressesFromStore() async {
    db.collection("addresses").get().then((document) {
      for (var address in document.docs) {
        addresses.add(Address(
            place: address['place'],
            name: address['name'],
            region: address['region'],
            state: address['state'],
            city: address['city'],
            street: address['street'],
            phone: address['phone']));

        notifyListeners();
      }
    });
  }

  void selectLanguge(int index) {
    DummyData.languages[index].isSelect = !DummyData.languages[index].isSelect;

    notifyListeners();
  }

  void addAddress(Address address) {
    DummyData.addresses.add(address);
    notifyListeners();
  }

  int? addressIndex;
  void setAddressIndex(int? index) {
    addressIndex = index;
    notifyListeners();
  }

  List<Address> getAddresses() {
    return DummyData.addresses;
  }

  Users getUserData() {
    return DummyData.user;
  }

  void editProfile(Users user) {
    DummyData.user.userEmail = user.userEmail;
    DummyData.user.userName = user.userName;
    DummyData.user.userPhone = user.userPhone;

    notifyListeners();
  }

  List<Category> getCategories() {
    return DummyData.categories;
  }

  List<Category> getcategoriesHome() {
    return DummyData.categories;
  }

  List<Orders> getStatus() {
    return DummyData.status;
  }

  int? selected_Status = 0;

  void setStatus(int index, String statusId) {
    selected_Status = index;
    selectedStatus = statusId;
    notifyListeners();
  }

  String selectedStatus = 'com';

  List<Notifications> getNotifications() {
    return DummyData.notifications;
  }

  List<Cheese> getCheese() {
    return DummyData.cheese;
  }

  List<Addition> getAddition() {
    return DummyData.addition;
  }

  List<String> getRecentSearch() {
    return DummyData.recentSearch;
  }

  String getCategoryName(String name) {
    return DummyData.categoryName[name].toString();
  }

  int selectedChesse = 0;

  List<String> additions = [];

  double? chessePrice;
  double? additionPrice;

  void setchessePrice(double price) {
    chessePrice = price;
    notifyListeners();
  }

  void addToCart(ItemCart item) {
    DummyData.user.basket.add(item);
    notifyListeners();
  }

  void setAddition(String selected) {
    additions.contains(selected)
        ? additions.remove(selected)
        : additions.add(selected);
    notifyListeners();
  }

  void setCheese(int index) {
    selectedChesse = index;
    notifyListeners();
  }

  List<Item> getItemsCategory({required String categoryId}) {
    return items.where((i) {
      return i.itemCategories!.any((element) => element == categoryId);
    }).toList();
  }

  List<Item> getDicountedItems() {
    return items.where((i) {
      return i.itemDiscount != null && i.itemDiscount != 0;
    }).toList();
  }

  List<Item> getFavoriteItems() {
    return items.where((i) {
      return i.isFavorite;
    }).toList();
  }

  void addInCart(String id) {
    int itemIndex = DummyData.items.indexWhere(
      (element) {
        return element.itemId.toLowerCase() == id.toLowerCase();
      },
    );
    int index = DummyData.user.basket.indexWhere(
      (element) {
        return element.item.itemId.toLowerCase() == id.toLowerCase();
      },
    );
    if (DummyData.user.basket[index].itemCount >=
        DummyData.items[itemIndex].itemCount) {
    } else {
      DummyData.user.basket[index].itemCount++;
    }

    notifyListeners();
  }

  double getPrice(index) {
    return DummyData.user.basket[index].itemPrice;
  }

  void ChangeCartPrice(int index) {
    DummyData.user.basket[index].itemPrice =
        DummyData.user.basket[index].itemCount *
            DummyData.user.basket[index].item.itemPrice;
    notifyListeners();
  }

  void deleteFromBasket(String id) {
    int index = DummyData.user.basket.indexWhere(
      (element) {
        return element.item.itemId.toLowerCase() == id.toLowerCase();
      },
    );
    DummyData.user.basket.removeAt(index);
    notifyListeners();
  }

  setRecept(int? type) {
    receptType = type;
    notifyListeners();
  }

  void decraseInCart(String id) {
    int index = DummyData.user.basket.indexWhere(
      (element) {
        return element.item.itemId.toLowerCase() == id.toLowerCase();
      },
    );

    DummyData.user.basket[index].itemCount--;

    if (DummyData.user.basket[index].itemCount < 0) {
      DummyData.user.basket[index].itemCount = 0;
    }

    notifyListeners();
  }

  void Like(String id) {
    int index = items.indexWhere(
      (element) {
        return element.itemId.toLowerCase() == id.toLowerCase();
      },
    );
    items[index].isFavorite = !items[index].isFavorite;

    notifyListeners();
  }

  String? selectedCategory = 'ready_juices';
  int selectedIndex = 5;
  void selectCategoryIndex({required int categoryIndex}) {
    selectedIndex = categoryIndex;
    notifyListeners();
  }

  void selectCategory({required String categoryId}) {
    selectedCategory = categoryId;
    notifyListeners();
  }

  List<Item> getProducts() {
    return items.where((i) {
      return i.itemCategories!.any((element) => element == selectedCategory);
    }).toList();
  }

  void setRating(double rating, String itemId) {
    int index = DummyData.items.indexWhere(
      (element) {
        return element.itemId.toLowerCase() == itemId.toLowerCase();
      },
    );
    DummyData.items[index].rating = rating;
    notifyListeners();
  }

  late Item selectedItem;
  int quantityCheckOut = 1;
  double priceCheckOut = 20;

  void setItem(Item item) {
    selectedItem = item;
    notifyListeners();
  }

  void addQuantity() {
    if (quantityCheckOut >= selectedItem.itemCount) {
    } else {
      quantityCheckOut++;
    }
    notifyListeners();
  }

  void decreaseQuantity() {
    quantityCheckOut--;
    if (quantityCheckOut < 0) {
      quantityCheckOut = 0;
    }
    notifyListeners();
  }

  void priceChangeCheckOut() {
    priceCheckOut = selectedItem.itemPrice * quantityCheckOut;
    notifyListeners();
  }

  List<ItemCart> orderItems = [];
  void RefreshOrders() {
    orderItems = setOrders();
   
  }

  List<ItemCart> setOrders() {
    if (selectedStatus.toLowerCase() == "com") {
      return getCompleteOrder();
    }
    if (selectedStatus.toLowerCase() == "disc") {
      return getCanceledOrder();
    }
    if (selectedStatus.toLowerCase() == "new") {
      return getNewOrder();
    } else {
      return [];
    }
  }

  List<ItemCart> getCompleteOrder() {
    return DummyData.user.basket
        .where((item) => item.orderStatus == Status.complete)
        .toList();
  }

  List<ItemCart> getCanceledOrder() {
    return DummyData.user.basket
        .where((item) => item.orderStatus == Status.canceled)
        .toList();
  }

  List<ItemCart> getNewOrder() {
    return DummyData.user.basket
        .where((item) =>
            item.orderStatus == Status.processing ||
            item.orderStatus == Status.delivery ||
            item.orderStatus == Status.request_accept)
        .toList();
  }

  ItemCart? selectedItemCart;

  void setSelectedItemCart(ItemCart item) {
    selectedItemCart = item;
    notifyListeners();
  }

  String? getStatusDesc(Status? status) {
    return DummyData.statusDescrption[status];
  }

  void save() {}
}
