class Item {
  String itemId;
  String itemImage;
  String itemName;
  double itemPrice;
  bool isFavorite;
  double rating;
  int ratingCount;
  int itemDiscount;
  int itemCount;
  String itemDiscription;

  List<dynamic>? itemCategories = [];
  Item(
      {required this.itemId,
      required this.itemImage,
      required this.itemName,
      required this.itemPrice,
      this.ratingCount = 1,
      this.itemDiscount = 0,
      this.rating = 1,
      this.itemDiscription = '',
      this.itemCount = 5,
      this.isFavorite = false,
      this.itemCategories});

  Map<String, dynamic> toMap() {
    return {
      'itemId': itemId,
      'itemImage': "assets/items/item.png",
      'itemName': itemName,
      'itemPrice': itemPrice,
      'itemDiscription': itemDiscription,
      'itemDiscount': itemDiscount,
      'itemCategories': itemCategories,
      "isFavorite": isFavorite
    };
  }
}
