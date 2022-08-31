import 'package:deli_pizza/models/dataProvider.dart';
import 'package:deli_pizza/models/item.dart';
import 'package:deli_pizza/models/screens.dart';
import 'package:deli_pizza/share/components/components.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataProvider dp = Provider.of<DataProvider>(context);

    List<Widget> items = List.generate(dp.getUserData().basket.length, (index) {
      Item item = dp.getUserData().basket[index].item;

      return Container(
        margin: const EdgeInsets.only(bottom: 50),
        child: SizedBox(
          height: 170,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(64, 212, 0, 1),
                    ),
                    child: IconButton(
                      splashRadius: 5,
                      iconSize: 15,
                      color: Colors.white,
                      onPressed: () {
                        dp.addInCart(item.itemId);
                        dp.ChangeCartPrice(index);
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text('${dp.getUserData().basket[index].itemCount}'),
                  const SizedBox(
                    width: 10,
                  ),
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
                        dp.decraseInCart(item.itemId);
                        dp.ChangeCartPrice(index);
                      },
                      iconSize: 15,
                      icon: const Icon(Icons.remove),
                    ),
                  ),
                  IconButton(
                    color: const Color.fromRGBO(170, 170, 170, 1),
                    iconSize: 20,
                    splashRadius: 5,
                    onPressed: () {
                      dp.deleteFromBasket(item.itemId);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
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
                            const SizedBox(height: 15),
                            SizedBox(
                              width: 188,
                              child: SingleChildScrollView(
                                reverse: true,
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(
                                      item.itemCategories!.length, (index) {
                                    return Container(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: Text(
                                        dp.getCategoryName(
                                            item.itemCategories![index]),
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                            color: Color.fromRGBO(
                                                124, 123, 123, 1),
                                            fontSize: 14,
                                            fontFamily: 'din',
                                            fontWeight: FontWeight.w300),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text('ر.عُ',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(50, 50, 50, 1),
                                            fontSize: 16,
                                            fontFamily: 'din',
                                            fontWeight: FontWeight.w400)),
                                    Text(
                                        dp
                                            .getPrice(index)
                                            .toStringAsPrecision(4),
                                        style: const TextStyle(
                                            color:
                                                Color.fromRGBO(50, 50, 50, 1),
                                            fontSize: 16,
                                            fontFamily: 'din',
                                            fontWeight: FontWeight.w400))
                                  ],
                                ),
                              ),
                              const Text('شامل الضريبة',
                                  style: TextStyle(
                                      color: Color.fromRGBO(124, 123, 123, 1),
                                      fontSize: 12,
                                      fontFamily: 'din',
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      child: Image.asset(
                        'assets/itemcover.png',
                        fit: BoxFit.cover,
                        width: 100,
                        height: 150,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });

    return Scaffold(
      appBar: buildAppBar(
        title: 'سلة المشتريات',
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                      width: 61,
                      height: 47,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(199, 64, 212, 0),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Center(
                        child:
                            Text('فحص', style: TextStyle(color: Colors.white)),
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: buildTextFormFieldGray(hintText: "ادخل كود الخصم"),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: items,
                  ),
                ),
              ),
              Column(
                children: [
                  const Divider(
                    color: Color.fromRGBO(230, 230, 231, 1),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text('ر.عُ',
                              style: TextStyle(
                                  color: Color.fromRGBO(170, 170, 170, 1),
                                  fontSize: 12,
                                  fontFamily: 'din',
                                  fontWeight: FontWeight.w400)),
                          Text("240,10",
                              style: TextStyle(
                                  color: Color.fromRGBO(170, 170, 170, 1),
                                  fontSize: 12,
                                  fontFamily: 'din',
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                      const Text('المجموع الفرعي',
                          style: TextStyle(
                              color: Color.fromRGBO(170, 170, 170, 1),
                              fontSize: 12,
                              fontFamily: 'din',
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text('ر.عُ',
                              style: TextStyle(
                                  color: Color.fromRGBO(170, 170, 170, 1),
                                  fontSize: 12,
                                  fontFamily: 'din',
                                  fontWeight: FontWeight.w400)),
                          Text("4,19",
                              style: TextStyle(
                                  color: Color.fromRGBO(170, 170, 170, 1),
                                  fontSize: 12,
                                  fontFamily: 'din',
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                      const Text('التوصيل',
                          style: TextStyle(
                              color: Color.fromRGBO(170, 170, 170, 1),
                              fontSize: 12,
                              fontFamily: 'din',
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              minimumSize: MaterialStateProperty.all(
                                  const Size(120, 40)),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(64, 212, 0, 1))),
                          onPressed: () {
                            pushNewScreen(context,
                                screen: const OrderTypeTimePage());
                          },
                          child: const Text(
                            'تاكيد الطلب',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'din',
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('المجموع',
                              style: TextStyle(
                                  color: Color.fromRGBO(170, 170, 170, 1),
                                  fontSize: 12,
                                  fontFamily: 'din',
                                  fontWeight: FontWeight.w400)),
                          Row(
                            children: const [
                              Text('ر.عُ',
                                  style: TextStyle(
                                      color: Color.fromRGBO(74, 74, 74, 1),
                                      fontSize: 16,
                                      fontFamily: 'din',
                                      fontWeight: FontWeight.w700)),
                              Text("244,29",
                                  style: TextStyle(
                                      color: Color.fromRGBO(74, 74, 74, 1),
                                      fontSize: 16,
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.w700)),
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
