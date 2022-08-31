import 'package:deli_pizza/models/category.dart';
import 'package:deli_pizza/models/dataProvider.dart';
import 'package:deli_pizza/models/item.dart';
import 'package:deli_pizza/models/languages.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../Screens/product_page.dart';

Widget buildTextFormField(
    {required String hintText,
    required IconData suffixIcon,
    IconData? prefixIcon,
    String? initialValue,
    TextEditingController? controller}) {
  return TextFormField(
    controller: controller != null ? controller : null,
    initialValue: initialValue,
    textDirection: TextDirection.rtl,
    style: const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w500, fontFamily: "din"),
    decoration: InputDecoration(
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(235, 234, 239, 1))),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 172, 170, 184))),
      prefixIcon: prefixIcon == null
          ? null
          : IconButton(
              icon: Icon(
                prefixIcon,
                color: const Color.fromRGBO(46, 46, 46, 1),
              ),
              onPressed: () {},
            ),
      suffixIcon: Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(235, 234, 239, 1),
              borderRadius: BorderRadius.circular(5)),
          child: Icon(
            suffixIcon,
          )),
      hintText: hintText,
      hintTextDirection: TextDirection.rtl,
      hintStyle: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, fontFamily: "din"),
    ),
  );
}

PersistentBottomNavBarItem buildBottomNavBarItem(
    {IconData? iconData, required String title, String imagePath = ""}) {
  return PersistentBottomNavBarItem(
    icon: iconData == null ? Image.asset(imagePath) : Icon(iconData),
    title: title,
    iconSize: 22,
    textStyle: const TextStyle(
      fontSize: 13,
      fontFamily: "din",
      fontWeight: FontWeight.w400,
    ),
    activeColorPrimary: const Color.fromRGBO(255, 0, 0, 1),
    inactiveColorPrimary: const Color.fromRGBO(74, 74, 74, 1),
  );
}

Widget buildProfileTile(
    {IconData? iconData, String title = "", Function()? onTap}) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(
            color: Color.fromRGBO(112, 112, 112, 1),
            width: 0.5,
            style: BorderStyle.solid),
      ),
    ),
    child: ListTile(
      onTap: onTap != null ? onTap : null,
      contentPadding: const EdgeInsets.only(bottom: 5),
      trailing: Text(
        title,
        textAlign: TextAlign.end,
        style: const TextStyle(
            color: Color.fromRGBO(46, 46, 46, 1),
            fontFamily: "din",
            fontWeight: FontWeight.w500,
            fontSize: 18),
      ),
      leading: IconButton(
        color: const Color.fromRGBO(112, 112, 112, 1),
        onPressed: iconData != null ? onTap : null,
        icon: iconData == null
            ? const SizedBox.shrink()
            : Icon(
                iconData,
                size: 20,
                color: const Color.fromRGBO(46, 46, 46, 1),
              ),
      ),
    ),
  );
}

Widget buildLanguage(
    {required Languages languages, required Function()? onTap}) {
  return Column(
    children: [
      Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
                color: Color.fromRGBO(112, 112, 112, 1),
                width: 0.5,
                style: BorderStyle.solid),
          ),
        ),
        child: ListTile(
          onTap: onTap,
          contentPadding: const EdgeInsets.only(bottom: 5),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                languages.languageName,
                style: const TextStyle(
                    color: Color.fromRGBO(50, 50, 50, 1),
                    fontFamily: "din",
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                languages.languageCode,
                style: const TextStyle(
                    color: Color.fromRGBO(124, 123, 123, 1),
                    fontFamily: "din",
                    fontSize: 10,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
          leading: languages.isSelect == true
              ? const Icon(
                  Icons.check,
                  color: Color.fromRGBO(255, 0, 0, 1),
                )
              : null,
        ),
      ),
      const SizedBox(
        height: 10,
      )
    ],
  );
}

PreferredSizeWidget buildAppBar(
    {String title = "", Widget? leading, Widget? action}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    leading: leading != null ? leading : null,
    leadingWidth: 60,
    title: Text(
      title,
      textAlign: TextAlign.right,
    ),
    titleTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontFamily: "din"),
    actions: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: action != null ? action : null),
    ],
    centerTitle: true,
    elevation: 0,
  );
}

Widget buildGreenButton({String title = "", required Function()? onPressed}) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(const Color.fromRGBO(64, 212, 0, 1)),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            fixedSize: MaterialStateProperty.all(const Size.fromHeight(40))),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontFamily: "din",
            fontWeight: FontWeight.w500,
          ),
        ),
        onPressed: onPressed),
  );
}

Widget buildGrayButton({String title = "", required Function()? onPressed}) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromRGBO(235, 234, 239, 1)),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            fixedSize: MaterialStateProperty.all(const Size.fromHeight(40))),
        child: Text(
          title,
          style: const TextStyle(
            color: Color.fromRGBO(125, 125, 123, 1),
            fontSize: 17,
            fontFamily: "din",
            fontWeight: FontWeight.w500,
          ),
        ),
        onPressed: onPressed),
  );
}

Widget buildRedButton({String title = "", required Function()? onPressed}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(const Color.fromRGBO(255, 0, 0, 1)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
              fixedSize: MaterialStateProperty.all(const Size.fromHeight(40))),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontFamily: "din",
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: onPressed),
    ),
  );
}

Widget buildTextFormFieldGray(
    {String hintText = "",
    IconData? prefixIcon,
    String? initialValue,
    TextEditingController? controller,
    double radius = 9}) {
  return TextFormField(
    controller: controller,
    initialValue: initialValue,
    textDirection: TextDirection.rtl,
    style: const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w500, fontFamily: "din"),
    decoration: InputDecoration(
      contentPadding:
          prefixIcon == null ? const EdgeInsets.only(right: 25) : null,
      fillColor: const Color.fromRGBO(235, 234, 239, 1),
      filled: true,
      enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide:
              const BorderSide(color: Color.fromRGBO(235, 234, 239, 1))),
      focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(radius + 5),
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 172, 170, 184))),
      prefixIcon: prefixIcon == null
          ? null
          : IconButton(
              icon: Icon(
                prefixIcon,
                color: const Color.fromRGBO(46, 46, 46, 1),
              ),
              onPressed: () {},
            ),
      hintText: hintText,
      hintTextDirection: TextDirection.rtl,
      hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: "din",
          color: Color.fromRGBO(155, 155, 155, 1)),
    ),
  );
}

Widget buildNewLocationChecker(
    {required String label,
    required Function(bool?) onChanged,
    required bool value}) {
  return Row(
    children: [
      Text(
        label,
        style: const TextStyle(
            fontSize: 16, fontFamily: "din", fontWeight: FontWeight.w400),
      ),
      const SizedBox(
        width: 6,
      ),
      Checkbox(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.black,
        checkColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(
              color: Color.fromRGBO(46, 46, 46, 1),
              width: 2,
            )),
      )
    ],
  );
}

Widget buildSocialMediaLink({required Widget child, Function()? onPressed}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
        border:
            Border.all(color: const Color.fromRGBO(112, 112, 112, 1), width: 1),
        shape: BoxShape.circle),
    padding: const EdgeInsets.all(2),
    child: IconButton(
      onPressed: onPressed,
      icon: child,
      iconSize: 25,
      color: const Color.fromRGBO(112, 112, 112, 1),
    ),
  );
}

Widget buildCategory(Category category, DataProvider dp) {
  return Stack(
    alignment: AlignmentDirectional.bottomCenter,
    fit: StackFit.expand,
    children: [
      Image.asset(
        category.image,
      ),
      Positioned(
        bottom: 20,
        child: Card(
          elevation: 3,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6))),
          color: const Color.fromRGBO(255, 255, 255, 0.86),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  category.name,
                  style: const TextStyle(
                      fontSize: 12,
                      fontFamily: "din",
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(46, 46, 46, 1)),
                ),
                Row(
                  children: [
                    const Text(
                      "منتج",
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: "din",
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(124, 123, 123, 1)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      dp
                          .getItemsCategory(categoryId: category.id)
                          .length
                          .toString(),
                      style: const TextStyle(
                          fontSize: 10,
                          fontFamily: "din",
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(124, 123, 123, 1)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      )
    ],
  );
}

// Widget buildItem(Item item, DataProvider dp) {
//   double discounted_price =
//       item.itemPrice - (item.itemPrice * item.itemDiscount / 100);
//   double discountPercentages =
//       100 * (item.itemPrice - discounted_price) / item.itemPrice;
//   List<Widget> categories = item.itemCategories!.map((element) {
//     return Text(
//       dp.getCategoryName(element),
//       style: const TextStyle(
//           color: Color.fromRGBO(124, 123, 123, 1),
//           fontSize: 12,
//           fontFamily: 'din',
//           fontWeight: FontWeight.w300),
//     );
//   }).toList();
//   return Column(
//     mainAxisSize: MainAxisSize.max,
//     crossAxisAlignment: CrossAxisAlignment.end,
//     children: [
//       Stack(
//         alignment: AlignmentDirectional.topCenter,
//         children: [
//           Image.asset(
//             item.itemImage,
//           ),
//           Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Container(
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Color.fromRGBO(0, 0, 0, 0.17),
//                 ),
//                 child: IconButton(
//                   padding: const EdgeInsets.all(6),
//                   constraints: const BoxConstraints(),
//                   tooltip: "اعجاب",
//                   splashRadius: 10,
//                   iconSize: 20,
//                   icon: Icon(
//                     item.isFavorite == true
//                         ? Icons.favorite
//                         : Icons.favorite_border,
//                     color: item.isFavorite == true ? Colors.red : Colors.white,
//                   ),
//                   onPressed: () {
//                     dp.Like(item.itemId);
//                   },
//                 ),
//               ),
//               item.itemDiscount == null || item.itemDiscount == 0
//                   ? const Padding(
//                       padding: EdgeInsets.only(top: 50),
//                       child: SizedBox(
//                         width: 50,
//                       ),
//                     )
//                   : Chip(
//                       label: Text(
//                         "-" + discountPercentages.toStringAsPrecision(2) + "%",
//                       ),
//                       backgroundColor: const Color.fromRGBO(175, 0, 0, 1),
//                       labelStyle: const TextStyle(
//                           fontFamily: 'din',
//                           fontSize: 10,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.white),
//                     )
//             ],
//           ),
//         ],
//       ),
//       Padding(
//         padding: const EdgeInsets.only(right: 8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           textDirection: TextDirection.ltr,
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Text(
//               item.itemName,
//               style: const TextStyle(
//                   color: Color.fromRGBO(50, 50, 50, 1),
//                   fontSize: 18,
//                   fontFamily: 'din',
//                   fontWeight: FontWeight.w400),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: categories,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 8),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   item.itemDiscount == null || item.itemDiscount == 0
//                       ? const SizedBox()
//                       : Padding(
//                           padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
//                           child: Row(
//                             children: [
//                               const Text(
//                                 'ر.عُ',
//                                 style: TextStyle(
//                                     color: Color.fromRGBO(124, 123, 123, 1),
//                                     decoration: TextDecoration.lineThrough,
//                                     fontSize: 11,
//                                     fontFamily: 'din',
//                                     fontWeight: FontWeight.w400),
//                               ),
//                               Text(item.itemPrice.toString(),
//                                   style: const TextStyle(
//                                       color: Color.fromRGBO(124, 123, 123, 1),
//                                       decoration: TextDecoration.lineThrough,
//                                       fontSize: 11,
//                                       fontFamily: 'din',
//                                       fontWeight: FontWeight.w400))
//                             ],
//                           ),
//                         ),
//                   const Text('ر.عُ',
//                       style: TextStyle(
//                           color: Color.fromRGBO(50, 50, 50, 1),
//                           fontSize: 16,
//                           fontFamily: 'din',
//                           fontWeight: FontWeight.w400)),
//                   item.itemDiscount == null || item.itemDiscount == 0
//                       ? Text(item.itemPrice.toStringAsPrecision(4),
//                           style: const TextStyle(
//                               color: Color.fromRGBO(50, 50, 50, 1),
//                               fontSize: 16,
//                               fontFamily: 'din',
//                               fontWeight: FontWeight.w400))
//                       : Text(discounted_price.toStringAsPrecision(4),
//                           style: const TextStyle(
//                               color: Color.fromRGBO(50, 50, 50, 1),
//                               fontSize: 16,
//                               fontFamily: 'din',
//                               fontWeight: FontWeight.w400))
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     ],
//   );
// }

Widget buildItem(Item item, DataProvider dp) {
  double discounted_price =
      item.itemPrice - (item.itemPrice * item.itemDiscount / 100);
  double discountPercentages =
      100 * (item.itemPrice - discounted_price) / item.itemPrice;
  List<Widget> categories = item.itemCategories!.map((element) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Text(
        dp.getCategoryName(element),
        style: const TextStyle(
            color: Color.fromRGBO(124, 123, 123, 1),
            fontSize: 12,
            fontFamily: 'din',
            fontWeight: FontWeight.w300),
      ),
    );
  }).toList();
  return Column(
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Consumer(
            builder: (context, value, child) {
              return InkWell(
                onTap: () {
                  dp.setItem(item);
                  dp.priceCheckOut = item.itemPrice;
                  pushNewScreen(context, screen: const ProductPage());
                },
                child: Image.network(
                  item.itemImage,
                  fit: BoxFit.cover,
                  height: 200,
                  width: 164,
                ),
              );
            },
          ),
          SizedBox(
            width: 160,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(0, 0, 0, 0.17),
                  ),
                  child: IconButton(
                    padding: const EdgeInsets.all(6),
                    constraints: const BoxConstraints(),
                    tooltip: "اعجاب",
                    splashRadius: 10,
                    iconSize: 20,
                    icon: Icon(
                      item.isFavorite == true
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color:
                          item.isFavorite == true ? Colors.red : Colors.white,
                    ),
                    onPressed: () {
                      dp.Like(item.itemId);
                    },
                  ),
                ),
                item.itemDiscount == null || item.itemDiscount == 0
                    ? const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: SizedBox(
                          width: 50,
                        ),
                      )
                    : Chip(
                        label: Text(
                          "-" +
                              discountPercentages.toStringAsPrecision(2) +
                              "%",
                        ),
                        backgroundColor: const Color.fromRGBO(175, 0, 0, 1),
                        labelStyle: const TextStyle(
                            fontFamily: 'din',
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      )
              ],
            ),
          ),
        ],
      ),
      SizedBox(
        width: 175,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              item.itemName,
              style: const TextStyle(
                  color: Color.fromRGBO(50, 50, 50, 1),
                  fontSize: 18,
                  fontFamily: 'din',
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              width: 164,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  children: categories,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  item.itemDiscount == null || item.itemDiscount == 0
                      ? const SizedBox()
                      : Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
                          child: Row(
                            children: [
                              const Text(
                                'ر.عُ',
                                style: TextStyle(
                                    color: Color.fromRGBO(124, 123, 123, 1),
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 11,
                                    fontFamily: 'din',
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(item.itemPrice.toString(),
                                  style: const TextStyle(
                                      color: Color.fromRGBO(124, 123, 123, 1),
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 11,
                                      fontFamily: 'din',
                                      fontWeight: FontWeight.w400))
                            ],
                          ),
                        ),
                  const Text('ر.عُ',
                      style: TextStyle(
                          color: Color.fromRGBO(50, 50, 50, 1),
                          fontSize: 16,
                          fontFamily: 'din',
                          fontWeight: FontWeight.w400)),
                  item.itemDiscount == null || item.itemDiscount == 0
                      ? Text(item.itemPrice.toStringAsPrecision(4),
                          style: const TextStyle(
                              color: Color.fromRGBO(50, 50, 50, 1),
                              fontSize: 16,
                              fontFamily: 'din',
                              fontWeight: FontWeight.w400))
                      : Text(discounted_price.toStringAsPrecision(4),
                          style: const TextStyle(
                              color: Color.fromRGBO(50, 50, 50, 1),
                              fontSize: 16,
                              fontFamily: 'din',
                              fontWeight: FontWeight.w400))
                ],
              ),
            )
          ],
        ),
      ),
    ],
  );
}

Widget buildinfoRow({String? leading, String? trailing, Function()? onTap}) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      leading != null
          ? InkWell(
              onTap: onTap,
              child: Text(
                leading,
                style: const TextStyle(
                    color: Color.fromRGBO(67, 67, 67, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: "din"),
              ),
            )
          : const SizedBox.shrink(),
      trailing != null
          ? Text(
              trailing,
              style: const TextStyle(
                  color: Color.fromRGBO(67, 67, 67, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: "din"),
            )
          : const SizedBox.shrink()
    ],
  );
}
