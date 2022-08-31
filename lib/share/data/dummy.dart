import 'package:deli_pizza/models/address.dart';
import 'package:deli_pizza/models/cart.dart';
import 'package:deli_pizza/models/category.dart';
import 'package:deli_pizza/models/choices.dart';
import 'package:deli_pizza/models/item.dart';
import 'package:deli_pizza/models/languages.dart';
import 'package:deli_pizza/models/notification.dart';
import 'package:deli_pizza/models/orderCategories.dart';
import 'package:deli_pizza/models/orderStatus.dart';
import 'package:deli_pizza/models/users.dart';

class DummyData {
  static List<Languages> languages = [
    Languages(
        languageName: "اسم اللغة", languageCode: "رمز اللغة", isSelect: true),
    Languages(
        languageName: "اسم اللغة", languageCode: "رمز اللغة", isSelect: false),
  ];

  static List<Address> addresses = [
    Address(
        place: "المنزل",
        name: "محمد",
        region: "غزة",
        state: "خانيونس",
        city: "عبسان الكبيرة",
        street: "شارع ابو نصر",
        phone: "0592524815")
  ];

  static List<String> recentSearch = [
    "ديلي دجاج",
    "برجر بلحم الجمل",
    "باستا",
  ];

  static Users user = Users(
      basket: [
        ItemCart(
          item: Item(
              itemId: "pizza3",
              itemImage: "assets/items/itemHome.png",
              itemName: "بيتزا جبنة",
              itemPrice: 33.55,
              itemCategories: ["pasta"]),
          itemCount: 5,
          itemPrice: 100.65,
        )
      ],
      urlImage: "assets/person.png",
      userName: "اسم المستخدم",
      userPhone: "01234567890",
      userEmail: "abed@gmail.com");

  static List<Cheese> cheese = [
    Cheese(cheeseType: 'عادي', cheesePrice: 25.45),
    Cheese(cheeseType: 'مزريلا', cheesePrice: 25.45),
    Cheese(cheeseType: 'ايمك', cheesePrice: 25.45)
  ];

  static List<Addition> addition = [
    Addition(
      additionType: 'جبنة',
      additionPrice: 25.45,
    ),
    Addition(additionType: 'خضار', additionPrice: 25.45),
    Addition(additionType: 'صوص الثوم', additionPrice: 25.45)
  ];
  static List<Category> categories = [
    Category(id: "pizaa", name: "بيتزا", image: "assets/categories/pizza.png"),
    Category(id: "burger", name: "برجر", image: "assets/categories/burger.png"),
    Category(id: "pasta", name: "باستا", image: "assets/categories/pasta.png"),
    Category(
        id: "kids_meals",
        name: "وجبات اطفال",
        image: "assets/categories/kids_meals.png"),
    Category(
        id: "appetizers",
        name: "مقبلات",
        image: "assets/categories/appetizers.png"),
    Category(
        id: "ready_juices",
        name: "عصائر جاهزة",
        image: "assets/categories/ready_juices.png"),
  ];

  static List<Item> items = [
    Item(
        itemId: "item1",
        itemImage: "assets/items/item.png",
        itemName: "بيتزا جبنة",
        itemPrice: 23.25,
        itemDiscription:
            'إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي  يطلع على صورة حقيقية لتصميم الموقع.',
        itemDiscount: 20,
        itemCategories: ["burger","kids_meals","appetizers"]),
    Item(
        itemId: "item2",
        itemImage: "assets/items/item2.png",
        itemName: "بيتزا جبنة",
        itemPrice: 23.25,
        itemCategories: [ "ready_juices","kids_meals"]),
    Item(
        itemId: "item3",
        itemImage: "assets/items/item3.png",
        itemName: "بيتزا جبنة",
        itemPrice: 33.55,
        itemDiscount: 10,
        itemCategories: ["pizaa","kids_meals","appetizers","pasta"]),
    Item(
        itemId: "item4",
        itemImage: "assets/items/item4.png",
        itemName: "بيتزا جبنة",
        itemPrice: 33.55,
        itemDiscount: 10,
        itemCategories: ["burger","kids_meals","appetizers","pasta"]),
        
    Item(
        itemId: "item5",
        itemImage: "assets/items/item5.png",
        itemName: "بيتزا جبنة",
        itemPrice: 33.55,
        itemCategories: ["pasta"]),
        Item(
        itemId: "item6",
        itemImage: "assets/items/item6.png",
        itemName: "بيتزا جبنة",
        itemPrice: 33.55,
        itemCategories: ["pizaa", "ready_juices","burger","kids_meals"]),
        Item(
        itemId: "item7",
        itemImage: "assets/items/item7.png",
        itemName: "بيتزا جبنة",
        itemPrice: 33.55,
        itemDiscount: 15,
        itemCategories: ["kids_meals","appetizers","pasta"]),
        Item(
        itemId: "item8",
        itemImage: "assets/items/item8.png",
        itemName: "بيتزا جبنة",
        itemPrice: 33.55,
        itemCategories: ["pizaa", "ready_juices","appetizers","pasta"]),
        Item(
        itemId: "item9",
        itemImage: "assets/items/item9.png",
        itemName: "بيتزا جبنة",
        itemPrice: 33.55,
        itemDiscount: 15,
        itemCategories: ["burger","kids_meals","appetizers"]),
  ];

  static Map<String, String> categoryName = {
    "pizaa": "بيتزا",
    "burger": "برجر",
    "pasta": "باستا",
    "kids_meals": "وجبات اطفال",
    "appetizers": "مقبلات",
    "ready_juices": "عصائر جاهزة",
  };

  static List<Orders> status = [
    Orders(status: "المكتملة", statusId: "com"),
    Orders(status: "ملغية", statusId: "disc"),
    Orders(status: "جديدة", statusId: "new"),
  ];

  static Map<Status, String> statusDescrption = {
    Status.delivery: "قيد التوصيل",
    Status.request_accept: "قبول الطلب",
    Status.processing: "قيد المعالجة",
    Status.complete: 'مكتمل',
    Status.canceled: 'ملغي',
  };
  static List<Notifications> notifications = [
    Notifications(
        itemName: "اسم المنتج يكون هنا بشكل واضح وملفت",
        date: "أكتوبر 11,2021",
        details:
            'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.'),
    Notifications(
        itemName: "اسم المنتج يكون هنا بشكل واضح وملفت",
        date: "أكتوبر 11,2021",
        details:
            'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.'),
    Notifications(
        itemName: "اسم المنتج يكون هنا بشكل واضح وملفت",
        date: "أكتوبر 11,2021",
        details:
            'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.'),
  ];
}
