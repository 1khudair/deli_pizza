import 'package:deli_pizza/models/screens.dart';
import 'package:deli_pizza/share/components/components.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class OrderDonePage extends StatelessWidget {
  const OrderDonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          title: 'تم الانتهاء',
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
          padding: const EdgeInsetsDirectional.fromSTEB(100, 25, 100, 25),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 40,
                  child: Icon(
                    Icons.check_outlined,
                    color: Colors.white,
                    size: 45,
                  ),
                  backgroundColor: Color.fromRGBO(255, 0, 0, 1),
                ),
                const Text('شكرا لك على التسوق',
                    style: TextStyle(
                        fontFamily: 'din',
                        fontSize: 20,
                        color: Color.fromRGBO(46, 46, 46, 1),
                        fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                    'إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد',
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'din',
                        fontSize: 14,
                        color: const Color.fromRGBO(79, 79, 79, 1),
                        fontWeight: FontWeight.w400)),
                const SizedBox(
                  height: 30,
                ),
                buildGreenButton(
                    onPressed: () {
                      pushNewScreen(context, screen: const HomePage());
                    },
                    title: "تسوق المزيد"),
                const SizedBox(
                  height: 15,
                ),
                buildGrayButton(
                    onPressed: () {
                      pushNewScreen(context, screen: const MyOrdersPage());
                    },
                    title: 'تتبع الطلب')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
