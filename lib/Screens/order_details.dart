import 'package:deli_pizza/models/cart.dart';
import 'package:deli_pizza/models/dataProvider.dart';
import 'package:deli_pizza/models/orderStatus.dart';
import 'package:deli_pizza/share/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataProvider dp = Provider.of<DataProvider>(context);
    ItemCart? order = dp.selectedItemCart;

    Color statusColor = const Color.fromRGBO(228, 111, 38, 1);

    if (order!.orderStatus == Status.complete) {
      statusColor = (Colors.green);
    } else if (order.orderStatus == Status.canceled) {
      statusColor = (const Color.fromRGBO(255, 0, 0, 1));
    }

    return Scaffold(
      appBar: buildAppBar(
          title: 'تفاصيل الطلب',
          action: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_forward_ios,
                  color: Color.fromRGBO(112, 112, 112, 1)))),
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "#${order.orderID}",
                        style: const TextStyle(
                            color: Color.fromRGBO(46, 46, 46, 1),
                            fontSize: 14,
                            fontFamily: 'neoSans',
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "رقم الطلب:   ",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: Color.fromRGBO(60, 60, 60, 1),
                            fontSize: 14,
                            fontFamily: 'neoSans',
                            fontWeight: FontWeight.w400),
                      ),
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
                                  color: Color.fromRGBO(255, 0, 0, 1),
                                  fontSize: 17,
                                  fontFamily: 'din',
                                  fontWeight: FontWeight.w400)),
                          Text("244,29",
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 0, 0, 1),
                                  fontSize: 17,
                                  fontFamily: 'din',
                                  fontWeight: FontWeight.w700)),
                          Text('المجموع',
                              style: TextStyle(
                                  color: Color.fromRGBO(46, 46, 46, 1),
                                  fontSize: 14,
                                  fontFamily: 'din',
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      Chip(
                        backgroundColor: statusColor,
                        label: Text(
                          dp.getStatusDesc(order.orderStatus).toString(),
                        ),
                        labelStyle: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'din',
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            ':تاريخ الدفع',
                            style: TextStyle(
                                fontFamily: "neoSans",
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(60, 60, 60, 1)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            order.payDate.toString(),
                            style: const TextStyle(
                                color: Color.fromRGBO(112, 112, 112, 1),
                                fontFamily: "neoSans",
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            ':تاريخ الطلب',
                            style: TextStyle(
                                fontFamily: "neoSans",
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(60, 60, 60, 1)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            order.orderDate.toString(),
                            style: const TextStyle(
                                color: Color.fromRGBO(112, 112, 112, 1),
                                fontFamily: "neoSans",
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ],
                  )
                ]),
                const Divider(
                  thickness: 1,
                  color: Color.fromRGBO(230, 230, 231, 1),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                const Color.fromRGBO(60, 167, 68, 1),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.phone),
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                children: const [
                                  Text(
                                    'محمد علي',
                                    style: TextStyle(
                                        fontFamily: 'din',
                                        fontSize: 16,
                                        color: Color.fromRGBO(74, 74, 74, 1),
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('مندوب التوصيل',
                                      style: TextStyle(
                                          fontFamily: 'din',
                                          color: Color.fromRGBO(74, 74, 74, 1),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400))
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Image.asset('assets/delivery.png')
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text(
                                  "قيد المعالجة",
                                  style: TextStyle(
                                      fontFamily: 'din',
                                      fontSize: 12,
                                      color: Color.fromRGBO(50, 50, 50, 1),
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Sat, 12 Sep 2020 12:45 PM",
                                    style: TextStyle(
                                        fontFamily: 'din',
                                        color: Color.fromRGBO(124, 123, 123, 1),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300))
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                const CircleAvatar(
                                  backgroundColor:
                                      const Color.fromRGBO(64, 212, 0, 0.40),
                                  radius: 15,
                                  child: Icon(
                                    Icons.circle,
                                    color: const Color.fromRGBO(64, 212, 0, 1),
                                  ),
                                ),
                                Transform.rotate(
                                  alignment: Alignment.center,
                                  angle: 190,
                                  child: const Icon(
                                    Icons.linear_scale,
                                    color: Colors.green,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text(
                                  "قبول الطلب",
                                  style: TextStyle(
                                      fontFamily: 'din',
                                      fontSize: 12,
                                      color: Color.fromRGBO(50, 50, 50, 1),
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Sat, 12 Sep 2020 12:45 PM",
                                    style: TextStyle(
                                        fontFamily: 'din',
                                        color: Color.fromRGBO(124, 123, 123, 1),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300))
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                const CircleAvatar(
                                  backgroundColor:
                                      const Color.fromRGBO(64, 212, 0, 0.40),
                                  radius: 15,
                                  child: Icon(
                                    Icons.circle,
                                    color: const Color.fromRGBO(64, 212, 0, 1),
                                  ),
                                ),
                                Transform.rotate(
                                  alignment: Alignment.center,
                                  angle: 190,
                                  child: const Icon(
                                    Icons.linear_scale,
                                    color: Colors.green,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text(
                                  "قيد التوصيل",
                                  style: TextStyle(
                                      fontFamily: 'din',
                                      fontSize: 12,
                                      color: Color.fromRGBO(50, 50, 50, 1),
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Sat, 12 Sep 2020 12:45 PM",
                                    style: TextStyle(
                                        fontFamily: 'din',
                                        color: Color.fromRGBO(124, 123, 123, 1),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300))
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                const CircleAvatar(
                                  backgroundColor:
                                      const Color.fromRGBO(64, 212, 0, 0.40),
                                  radius: 15,
                                  child: Icon(
                                    Icons.circle,
                                    color: const Color.fromRGBO(64, 212, 0, 1),
                                  ),
                                ),
                                Transform.rotate(
                                  alignment: Alignment.center,
                                  angle: 190,
                                  child: const Icon(
                                    Icons.linear_scale,
                                    color: Colors.green,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text(
                                  "مكتمل",
                                  style: TextStyle(
                                      fontFamily: 'din',
                                      fontSize: 12,
                                      color: Color.fromRGBO(50, 50, 50, 1),
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Sat, 12 Sep 2020 12:45 PM",
                                    style: TextStyle(
                                        fontFamily: 'din',
                                        color: Color.fromRGBO(124, 123, 123, 1),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300))
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                const CircleAvatar(
                                  backgroundColor:
                                      const Color.fromRGBO(64, 212, 0, 0.40),
                                  radius: 15,
                                  child: Icon(
                                    Icons.circle,
                                    color: const Color.fromRGBO(64, 212, 0, 1),
                                  ),
                                ),
                                Transform.rotate(
                                  alignment: Alignment.center,
                                  angle: 80,
                                  child: const Icon(
                                    Icons.linear_scale,
                                    color: Colors.green,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: Color.fromRGBO(230, 230, 231, 1),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('الدفع والتوصيل',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'din',
                                  color: Color.fromRGBO(74, 74, 74, 1),
                                  fontWeight: FontWeight.w500)),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text('طريق الدفع',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'din',
                                      color: Color.fromRGBO(125, 125, 123, 1),
                                      fontWeight: FontWeight.w400)),
                              Text('كاش',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'din',
                                      color: Color.fromRGBO(74, 74, 74, 1),
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Text('رقم الجوال',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'din',
                                          color:
                                              Color.fromRGBO(125, 125, 123, 1),
                                          fontWeight: FontWeight.w400)),
                                  Text('059712345678',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'din',
                                          color: Color.fromRGBO(74, 74, 74, 1),
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    Text('اسم مندوب التوصيل',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'din',
                                            color: Color.fromRGBO(
                                                125, 125, 123, 1),
                                            fontWeight: FontWeight.w400)),
                                    Text('محمد علي',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'din',
                                            color:
                                                Color.fromRGBO(74, 74, 74, 1),
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Text('عنوان التوصيل',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'din',
                                        color: Color.fromRGBO(125, 125, 123, 1),
                                        fontWeight: FontWeight.w400)),
                              ),
                              Text(
                                  ",اسم الشارع" +
                                      ",المدينة" +
                                      ",الرمز البريدي" +
                                      ",المنطقة",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'din',
                                      color: Color.fromRGBO(74, 74, 74, 1),
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
