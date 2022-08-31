import 'package:deli_pizza/models/address.dart';
import 'package:deli_pizza/models/notification.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../Screens/search.dart';

class SearchField extends StatelessWidget {
  String? hintText;
  Widget? prefix;
  TextEditingController? controller;
  SearchField({Key? key, this.hintText, this.prefix, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        onTap: prefix == null
            ? () {
                pushNewScreen(context, screen: SearchPage(), withNavBar: false);
              }
            : null,
        controller: controller,
        textDirection: TextDirection.rtl,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          fontFamily: "din",
        ),
        decoration: InputDecoration(
            prefixIcon: prefix != null ? prefix : null,
            suffixIcon: const Icon(
              Icons.search,
              size: 25,
            ),
            enabledBorder: const UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide(
                  color: Color.fromRGBO(240, 240, 240, 1),
                )),
            focusedBorder: const UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide(
                  color: Color.fromRGBO(240, 240, 240, 1),
                )),
            disabledBorder: const UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide(
                  color: Color.fromRGBO(240, 240, 240, 1),
                )),
            fillColor: const Color.fromRGBO(240, 240, 240, 1),
            filled: true,
            hintText: hintText,
            hintTextDirection: TextDirection.rtl,
            hintStyle: const TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(155, 155, 155, 1),
                fontWeight: FontWeight.w400,
                fontFamily: "din")),
      ),
    );
  }
}

Widget buildAddress({required Address address}) {
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: const BorderSide(
            width: 0.5, color: Color.fromRGBO(155, 155, 155, 1))),
    child: Container(
      width: double.infinity,
      alignment: Alignment.topRight,
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            address.place,
            textAlign: TextAlign.end,
            style: const TextStyle(
                fontSize: 20, fontFamily: "din", fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "  الاسم  : " + address.name,
            textAlign: TextAlign.end,
            style: const TextStyle(
                fontSize: 14, fontFamily: "din", fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "  المحافظة  : " + address.region,
            textAlign: TextAlign.end,
            style: const TextStyle(
                fontSize: 14, fontFamily: "din", fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "  الولاية  : " + address.state,
            textAlign: TextAlign.end,
            style: const TextStyle(
                fontSize: 14, fontFamily: "din", fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "  المدينة  : " + address.city,
            textAlign: TextAlign.end,
            style: const TextStyle(
                fontSize: 14, fontFamily: "din", fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "  اسم الشارع  : " + address.street,
            textAlign: TextAlign.end,
            style: const TextStyle(
                fontSize: 14, fontFamily: "din", fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "  رقم الجوال  : " + address.phone,
            textAlign: TextAlign.end,
            style: const TextStyle(
                fontSize: 14, fontFamily: "din", fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    ),
  );
}

Widget buildNotification(Notifications notification) {
  return Container(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
    decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: Color.fromRGBO(124, 123, 123, 1), width: 0.2))),
    child: Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              notification.date.toString(),
              style: const TextStyle(
                  color: Color.fromRGBO(124, 123, 123, 1),
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                  fontFamily: "din"),
            ),
            Text(
              notification.itemName.toString(),
              style: const TextStyle(
                  color: Color.fromRGBO(50, 50, 50, 1),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: "din"),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          notification.details.toString(),
          softWrap: true,
          maxLines: 2,
          textAlign: TextAlign.end,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              color: Color.fromRGBO(124, 123, 123, 1),
              fontSize: 10,
              fontWeight: FontWeight.w300,
              fontFamily: "din"),
        ),
      ],
    ),
  );
}

Widget buildRecentSearch(String label) {
  return Chip(
    label: Text(label),
    backgroundColor: Colors.white,
    side: const BorderSide(color: Color.fromRGBO(247, 58, 58, 1)),
    labelStyle: const TextStyle(
      color: Color.fromRGBO(247, 58, 58, 1),
    ),
  );
}
