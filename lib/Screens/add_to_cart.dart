import 'package:deli_pizza/models/cart.dart';
import 'package:deli_pizza/models/dataProvider.dart';
import 'package:deli_pizza/models/item.dart';
import 'package:deli_pizza/models/screens.dart';
import 'package:deli_pizza/share/components/components.dart';

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'package:provider/provider.dart';

class AddToCardPage extends StatelessWidget {
  const AddToCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataProvider dp = Provider.of<DataProvider>(context);

    Item item = dp.selectedItem;

    List<Widget> categories =
        List.generate(item.itemCategories!.length, (index) {
      return Padding(
        padding: const EdgeInsets.only(left: 15),
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
        body: Padding(
      padding: const EdgeInsets.fromLTRB(10, 40, 15, 0),
      child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.max, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SizedBox(
                height: 100,
                width: 260,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: categories,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
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
                    ),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Image.asset(
                'assets/itemcover.png',
                fit: BoxFit.cover,
                width: 94,
                height: 100,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          child: Column(
            children: [
              buildinfoRow(trailing: 'نوع الجبنة'),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: List.generate(dp.getCheese().length, (index) {
                      return Container(
                        margin: const EdgeInsets.only(left: 15),
                        child: ChoiceChip(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          labelStyle: TextStyle(
                              color: dp.selectedChesse == index
                                  ? Colors.white
                                  : const Color.fromRGBO(67, 67, 67, 1)),
                          label: Column(
                            children: [
                              Text(dp.getCheese()[index].cheeseType,
                                  style: const TextStyle(
                                      fontFamily: 'din',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400)),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('ر.عُ',
                                      style: TextStyle(
                                          fontFamily: 'din',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                                  Text(
                                      dp
                                          .getCheese()[index]
                                          .cheesePrice
                                          .toString(),
                                      style: const TextStyle(
                                          fontFamily: 'din',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ],
                          ),
                          disabledColor: const Color.fromRGBO(235, 234, 239, 1),
                          selectedColor: const Color.fromRGBO(247, 58, 58, 1),
                          selected: dp.selectedChesse == index,
                          onSelected: (selected) {
                            dp.setCheese(index);
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
                      color: Color.fromARGB(200, 0, 0, 0), width: 0.2))),
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
                    children: List.generate(dp.getAddition().length, (index) {
                      return Container(
                        margin: const EdgeInsets.only(left: 15),
                        child: ChoiceChip(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          labelStyle: TextStyle(
                              color: dp.additions.contains(
                                      dp.getAddition()[index].additionType)
                                  ? Colors.white
                                  : const Color.fromRGBO(67, 67, 67, 1)),
                          label: Column(
                            children: [
                              Text(dp.getAddition()[index].additionType,
                                  style: const TextStyle(
                                      fontFamily: 'din',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400)),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('ر.عُ',
                                      style: TextStyle(
                                          fontFamily: 'din',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                                  Text(
                                      dp
                                          .getAddition()[index]
                                          .additionPrice
                                          .toString(),
                                      style: const TextStyle(
                                          fontFamily: 'din',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ],
                          ),
                          disabledColor: const Color.fromRGBO(235, 234, 239, 1),
                          selectedColor: const Color.fromRGBO(247, 58, 58, 1),
                          selected: dp.additions
                              .contains(dp.getAddition()[index].additionType),
                          onSelected: (selected) {
                            dp.setAddition(
                                dp.getAddition()[index].additionType);
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
                      color: Color.fromARGB(200, 0, 0, 0), width: 0.2))),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 55),
              child: Text(
                'المجموع',
                style: TextStyle(
                    color: Color.fromRGBO(67, 67, 67, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: "din"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 5),
              child: Text(
                'الكمية',
                style: TextStyle(
                    color: Color.fromRGBO(67, 67, 67, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: "din"),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('ر.عُ',
                    style: TextStyle(
                        fontFamily: 'din',
                        fontSize: 27,
                        fontWeight: FontWeight.w400)),
                Text(dp.priceCheckOut.toStringAsPrecision(4),
                    style: const TextStyle(
                        fontFamily: 'din',
                        fontSize: 27,
                        fontWeight: FontWeight.w400)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(221, 221, 221, 1),
                      ),
                      shape: BoxShape.circle),
                  child: IconButton(
                    splashRadius: 5,
                    color: const Color.fromARGB(170, 170, 170, 100),
                    onPressed: () {
                      dp.decreaseQuantity();
                      dp.priceChangeCheckOut();
                    },
                    icon: const Icon(Icons.remove),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text('${dp.quantityCheckOut}'),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(64, 212, 0, 1),
                  ),
                  child: IconButton(
                    splashRadius: 5,
                    iconSize: 20,
                    color: Colors.white,
                    onPressed: () {
                      dp.addQuantity();
                      dp.priceChangeCheckOut();
                    },
                    icon: const Icon(Icons.add),
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        SizedBox(
            width: 250,
            child: buildGreenButton(
                onPressed: () {
                  dp.addToCart(ItemCart(
                      item: item,
                      itemCount: dp.quantityCheckOut,
                      itemPrice: dp.priceCheckOut));
                  dp.RefreshOrders;
                  pushNewScreen(context, screen: const MyCartPage());
                },
                title: "إضافة الى السلة")),
        const SizedBox(
          height: 40,
        ),
      ])),
    ));
  }
}
