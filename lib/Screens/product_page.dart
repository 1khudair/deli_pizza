import 'package:deli_pizza/Screens/add_to_cart.dart';
import 'package:deli_pizza/models/cart.dart';
import 'package:deli_pizza/models/dataProvider.dart';
import 'package:deli_pizza/models/item.dart';
import 'package:deli_pizza/share/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import 'my_cart.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataProvider dp = Provider.of<DataProvider>(context);

    Item item = dp.selectedItem;
    double discounted_price =
        item.itemPrice - (item.itemPrice * item.itemDiscount / 100);
    double discountPercentages =
        100 * (item.itemPrice - discounted_price) / item.itemPrice;

    List<Widget> categories =
        List.generate(item.itemCategories!.length, (index) {
      return Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text(
          dp.getCategoryName(item.itemCategories![index]),
          style: const TextStyle(
              color: Color.fromRGBO(124, 123, 123, 1),
              fontSize: 14,
              fontFamily: 'din',
              fontWeight: FontWeight.w300),
        ),
      );
    });

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            clipBehavior: Clip.hardEdge,
            children: [
              Image.asset(
                'assets/itemcover.png',
                fit: BoxFit.cover,
                width: 500,
                height: 260,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsetsDirectional.only(start: 15),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(155, 0, 0, 0),
                      ),
                      child: IconButton(
                        padding: const EdgeInsets.all(6),
                        constraints: const BoxConstraints(),
                        tooltip: "مشاركة",
                        splashRadius: 10,
                        iconSize: 20,
                        color: Colors.white,
                        icon: const Icon(Icons.share),
                        onPressed: () {
                          dp.Like(item.itemId);
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsetsDirectional.only(end: 15),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(155, 0, 0, 0),
                      ),
                      child: IconButton(
                        padding: const EdgeInsets.all(6),
                        constraints: const BoxConstraints(),
                        splashRadius: 10,
                        iconSize: 20,
                        color: Colors.white,
                        icon: const Icon(Icons.keyboard_arrow_right),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        margin:
                            const EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(90, 0, 0, 0),
                        ),
                        child: IconButton(
                          padding: const EdgeInsets.all(6),
                          constraints: const BoxConstraints(),
                          tooltip: "اعجاب",
                          splashRadius: 10,
                          iconSize: 25,
                          icon: Icon(
                            item.isFavorite == true
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: item.isFavorite == true
                                ? Colors.red
                                : Colors.white,
                          ),
                          onPressed: () {
                            dp.Like(item.itemId);
                          },
                        ),
                      ),
                    ),
                    item.itemDiscount == null || item.itemDiscount == 0
                        ? const Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: SizedBox(
                              width: 50,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Chip(
                              label: Text(
                                "-" +
                                    discountPercentages.toStringAsPrecision(2) +
                                    "%",
                              ),
                              backgroundColor:
                                  const Color.fromRGBO(175, 0, 0, 1),
                              labelStyle: const TextStyle(
                                  fontFamily: 'din',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: categories,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            item.itemName,
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                color: Color.fromRGBO(50, 50, 50, 1),
                                fontSize: 18,
                                fontFamily: 'din',
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            textDirection: TextDirection.rtl,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 30,
                                child: Chip(
                                  label: Text(
                                    item.rating.toStringAsPrecision(2),
                                  ),
                                  labelPadding: const EdgeInsets.symmetric(
                                      horizontal: 2.5),
                                  backgroundColor:
                                      const Color.fromRGBO(175, 0, 0, 1),
                                  labelStyle: const TextStyle(
                                      fontFamily: 'din',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              RatingBar.builder(
                                itemBuilder: (context, index) {
                                  return const Icon(
                                    Icons.star,
                                    color: Color.fromRGBO(228, 111, 38, 1),
                                  );
                                },
                                onRatingUpdate: (rating) {
                                  dp.setRating(rating, item.itemId);
                                },
                                glow: false,
                                allowHalfRating: true,
                                itemSize: 20,
                                updateOnDrag: true,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${item.ratingCount} تقييم ",
                                textDirection: TextDirection.rtl,
                                style: const TextStyle(
                                  color: Color.fromRGBO(124, 123, 123, 1),
                                  fontFamily: 'din',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: item.itemCount != null || item.itemCount != 0
                                ? const Text("في المخزن",
                                    style: TextStyle(
                                      color: Color.fromRGBO(46, 46, 46, 1),
                                      fontFamily: 'din',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ))
                                : const Text('غير متوفر حاليا',
                                    style: TextStyle(
                                      color: Color.fromRGBO(46, 46, 46, 1),
                                      fontFamily: 'din',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    )),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          item.itemDiscount == null || item.itemDiscount == 0
                              ? const SizedBox()
                              : Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 5, 25),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'ر.عُ',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                124, 123, 123, 1),
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontSize: 11,
                                            fontFamily: 'din',
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(item.itemPrice.toString(),
                                          style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  124, 123, 123, 1),
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: 11,
                                              fontFamily: 'din',
                                              fontWeight: FontWeight.w400))
                                    ],
                                  ),
                                ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Text('ر.عُ',
                                      style: TextStyle(
                                          color: Color.fromRGBO(50, 50, 50, 1),
                                          fontSize: 16,
                                          fontFamily: 'din',
                                          fontWeight: FontWeight.w400)),
                                  item.itemDiscount == null ||
                                          item.itemDiscount == 0
                                      ? Text(
                                          item.itemPrice.toStringAsPrecision(4),
                                          style: const TextStyle(
                                              color:
                                                  Color.fromRGBO(50, 50, 50, 1),
                                              fontSize: 16,
                                              fontFamily: 'din',
                                              fontWeight: FontWeight.w400))
                                      : Text(
                                          discounted_price
                                              .toStringAsPrecision(4),
                                          style: const TextStyle(
                                              color:
                                                  Color.fromRGBO(50, 50, 50, 1),
                                              fontSize: 16,
                                              fontFamily: 'din',
                                              fontWeight: FontWeight.w400)),
                                ],
                              ),
                              const Text('شامل الضريبة',
                                  style: TextStyle(
                                      color: Color.fromRGBO(124, 123, 123, 1),
                                      fontSize: 12,
                                      fontFamily: 'din',
                                      fontWeight: FontWeight.w400))
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const Divider(
                        color: Color.fromARGB(91, 112, 112, 112),
                      ),
                      Container(
                        child: Column(
                          children: [
                            buildinfoRow(trailing: 'نوع الجبنة'),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  children: List.generate(dp.getCheese().length,
                                      (index) {
                                    return Container(
                                      margin: const EdgeInsets.only(left: 15),
                                      child: ChoiceChip(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        labelStyle: TextStyle(
                                            color: dp.selectedChesse == index
                                                ? Colors.white
                                                : const Color.fromRGBO(
                                                    67, 67, 67, 1)),
                                        label: Column(
                                          children: [
                                            Text(
                                                dp
                                                    .getCheese()[index]
                                                    .cheeseType,
                                                style: const TextStyle(
                                                    fontFamily: 'din',
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Text('ر.عُ',
                                                    style: TextStyle(
                                                        fontFamily: 'din',
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                Text(
                                                    dp
                                                        .getCheese()[index]
                                                        .cheesePrice
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontFamily: 'din',
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                              ],
                                            ),
                                          ],
                                        ),
                                        disabledColor: const Color.fromRGBO(
                                            235, 234, 239, 1),
                                        selectedColor: const Color.fromRGBO(
                                            247, 58, 58, 1),
                                        selected: dp.selectedChesse == index,
                                        onSelected: (selected) {
                                          dp.setCheese(index);
                                          dp.setchessePrice(dp
                                              .getCheese()[index]
                                              .cheesePrice);
                                        },
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            )
                          ],
                        ),
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color.fromARGB(200, 0, 0, 0),
                                    width: 0.2))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: buildinfoRow(trailing: 'اضافات'),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  children: List.generate(
                                      dp.getAddition().length, (index) {
                                    return Container(
                                      margin: const EdgeInsets.only(left: 15),
                                      child: ChoiceChip(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        labelStyle: TextStyle(
                                            color: dp.additions.contains(dp
                                                    .getAddition()[index]
                                                    .additionType)
                                                ? Colors.white
                                                : const Color.fromRGBO(
                                                    67, 67, 67, 1)),
                                        label: Column(
                                          children: [
                                            Text(
                                                dp
                                                    .getAddition()[index]
                                                    .additionType,
                                                style: const TextStyle(
                                                    fontFamily: 'din',
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Text('ر.عُ',
                                                    style: TextStyle(
                                                        fontFamily: 'din',
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                Text(
                                                    dp
                                                        .getAddition()[index]
                                                        .additionPrice
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontFamily: 'din',
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                              ],
                                            ),
                                          ],
                                        ),
                                        disabledColor: const Color.fromRGBO(
                                            235, 234, 239, 1),
                                        selectedColor: const Color.fromRGBO(
                                            247, 58, 58, 1),
                                        selected: dp.additions.contains(dp
                                            .getAddition()[index]
                                            .additionType),
                                        onSelected: (selected) {
                                          dp.setAddition(dp
                                              .getAddition()[index]
                                              .additionType);
                                        },
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            )
                          ],
                        ),
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color.fromARGB(200, 0, 0, 0),
                                    width: 0.2))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: buildinfoRow(trailing: 'وصف المنتج'),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(item.itemDiscription,
                                style: const TextStyle(
                                    fontFamily: 'din',
                                    fontSize: 15,
                                    color: Color.fromARGB(211, 125, 125, 123),
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.right,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true)
                          ],
                        ),
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color.fromARGB(200, 0, 0, 0),
                                    width: 0.2))),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color.fromRGBO(64, 212, 0, 1)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5))),
                                    fixedSize: MaterialStateProperty.all(
                                        const Size.fromHeight(47))),
                                child: const Text(
                                  'الشراء الان',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontFamily: "din",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                onPressed: () {
                                  dp.addToCart(ItemCart(
                                      item: item,
                                      itemCount: 1,
                                      itemPrice: item.itemPrice));
                                  dp.RefreshOrders;
                                  pushNewScreen(context,
                                      screen: const MyCartPage());
                                }),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                              width: 61,
                              height: 47,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(150, 64, 212, 0),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(5)),
                              child: IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      barrierColor: Colors.black,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(25.0),
                                        ),
                                      ),
                                      context: context,
                                      builder: (context) {
                                        return const AddToCardPage();
                                      });
                                },
                                icon: const Icon(Icons.shopping_cart_checkout),
                                color: Colors.white,
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
