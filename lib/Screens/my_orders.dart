import 'package:deli_pizza/models/cart.dart';
import 'package:deli_pizza/models/dataProvider.dart';
import 'package:deli_pizza/models/orderCategories.dart';
import 'package:deli_pizza/models/orderStatus.dart';
import 'package:deli_pizza/share/components/components.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import 'order_details.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataProvider dp = Provider.of<DataProvider>(context, listen: true);
    dp.RefreshOrders();
    List<ItemCart> items = dp.orderItems;
    return Scaffold(
      appBar: buildAppBar(
        title: 'طلباتي',
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: List.generate(dp.getStatus().length, (index) {
                      dp.RefreshOrders();
                      Orders status = dp.getStatus()[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: ChoiceChip(
                          label: Text(status.status),
                          selected: index == dp.selected_Status,
                          backgroundColor: Colors.white,
                          onSelected: (selected) {
                            dp.setStatus(index, status.statusId);
                            dp.RefreshOrders();
                          },
                          selectedColor: const Color.fromRGBO(255, 0, 0, 1),
                          labelStyle: TextStyle(
                            color: index == dp.selected_Status
                                ? Colors.white
                                : const Color.fromRGBO(125, 125, 123, 1),
                            fontFamily: 'din',
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              dp.orderItems.length == 0
                  ? const SizedBox.shrink()
                  : Expanded(
                      child: ListView.builder(
                        itemCount: dp.orderItems.length,
                        itemBuilder: (context, index) {
                          Color statusColor =
                              const Color.fromRGBO(228, 111, 38, 1);

                          if (items[index].orderStatus == Status.complete) {
                            statusColor = (Colors.green);
                          } else if (items[index].orderStatus ==
                              Status.canceled) {
                            statusColor = (const Color.fromRGBO(255, 0, 0, 1));
                          }

                          return InkWell(
                            onTap: () {
                              dp.setSelectedItemCart(items[index]);
                              pushNewScreen(context,
                                  screen: const OrderDetailsPage());
                            },
                            child: Card(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  side: BorderSide(
                                      color: Color.fromRGBO(156, 156, 156, 1),
                                      width: 0.25)),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text("#${items[index].orderID}",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'neoSans',
                                              color:
                                                  Color.fromRGBO(45, 45, 45, 1),
                                              fontWeight: FontWeight.w400)),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                        "رقم الطلب:   ",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'neoSans',
                                            color:
                                                Color.fromRGBO(60, 60, 60, 1),
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      items[index]
                                                          .item
                                                          .itemName,
                                                      textAlign: TextAlign.end,
                                                      style: const TextStyle(
                                                          color: Color.fromRGBO(
                                                              50, 50, 50, 1),
                                                          fontSize: 18,
                                                          fontFamily: 'din',
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    items[index]
                                                        .item
                                                        .itemCategories!
                                                        .length, (index) {
                                                  return Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Text(
                                                      dp.getCategoryName(items[
                                                                  index]
                                                              .item
                                                              .itemCategories![
                                                          index]),
                                                      textAlign: TextAlign.end,
                                                      style: const TextStyle(
                                                          color: Color.fromRGBO(
                                                              124, 123, 123, 1),
                                                          fontSize: 14,
                                                          fontFamily: 'din',
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  );
                                                }),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                        "  ${items[index].itemCount} x   ",
                                                        style: const TextStyle(
                                                            fontFamily:
                                                                'DMSans',
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400)),
                                                    const Text('ر.عُ',
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    50,
                                                                    50,
                                                                    50,
                                                                    1),
                                                            fontSize: 16,
                                                            fontFamily: 'din',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400)),
                                                    Text(
                                                        items[index]
                                                            .item
                                                            .itemPrice
                                                            .toString(),
                                                        style: const TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    50,
                                                                    50,
                                                                    50,
                                                                    1),
                                                            fontSize: 16,
                                                            fontFamily: 'din',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400))
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                        child: Image.asset(
                                          'assets/itemcover.png',
                                          fit: BoxFit.cover,
                                          width: 90.9,
                                          height: 85.17,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    thickness: 1,
                                    color: Color.fromRGBO(230, 230, 231, 1),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: const [
                                          Text('ر.عُ',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      228, 111, 38, 1),
                                                  fontSize: 17,
                                                  fontFamily: 'din',
                                                  fontWeight: FontWeight.w400)),
                                          Text("244,29",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      228, 111, 38, 1),
                                                  fontSize: 17,
                                                  fontFamily: 'din',
                                                  fontWeight: FontWeight.w700)),
                                          Text('المجموع',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      46, 46, 46, 1),
                                                  fontSize: 14,
                                                  fontFamily: 'din',
                                                  fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                      Chip(
                                        backgroundColor: statusColor,
                                        label: Text(
                                          dp
                                              .getStatusDesc(
                                                  items[index].orderStatus)
                                              .toString(),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const Text(
                                            ':تاريخ الدفع',
                                            style: TextStyle(
                                                fontFamily: "neoSans",
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    60, 60, 60, 1)),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            items[index].payDate.toString(),
                                            style: const TextStyle(
                                                color: Color.fromRGBO(
                                                    112, 112, 112, 1),
                                                fontFamily: "neoSans",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const Text(
                                            ':تاريخ الطلب',
                                            style: TextStyle(
                                                fontFamily: "neoSans",
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    60, 60, 60, 1)),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            items[index].orderDate.toString(),
                                            style: const TextStyle(
                                                color: Color.fromRGBO(
                                                    112, 112, 112, 1),
                                                fontFamily: "neoSans",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ]),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
