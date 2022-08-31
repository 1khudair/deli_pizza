import 'package:deli_pizza/models/address.dart';
import 'package:deli_pizza/models/dataProvider.dart';
import 'package:deli_pizza/models/screens.dart';
import 'package:deli_pizza/share/components/components.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataProvider dp = Provider.of<DataProvider>(context);
    return Scaffold(
      appBar: buildAppBar(
          title: 'بيانات التوصيل',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    alignment: Alignment.centerRight,
                    icon: Container(
                      margin: const EdgeInsets.all(5),
                      alignment: Alignment.center,
                      child: Image.asset("assets/add.png"),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(255, 0, 0, 1)),
                    ),
                    onPressed: () {
                     
                      pushNewScreen(context, screen: NewLocationPage());
                    },
                  ),
                  const Text(
                    'عنوان التوصيل',
                    style: TextStyle(
                        color: Color.fromRGBO(50, 50, 50, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: "din"),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    Address address = dp.getAddress()[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        toggleable: true,
                        secondary: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.edit)),
                        value: index,
                        groupValue: dp.addressIndex,
                        onChanged: (int? value) {
                          dp.setAddressIndex(value);
                        },
                        activeColor: const Color.fromRGBO(255, 0, 0, 1),
                        title: Align(
                          alignment: Alignment.center,
                          child: Text(
                            address.place,
                            style: const TextStyle(
                                color: Color.fromRGBO(46, 46, 46, 1),
                                fontFamily: 'din',
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        subtitle: Column(
                          children: [
                            Text(address.phone,
                                style: const TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 14,
                                    color: Color.fromRGBO(15, 13, 35, 0.50),
                                    fontWeight: FontWeight.w400)),
                            Text(
                                address.street +
                                    ' - ' +
                                    address.region +
                                    ' - ' +
                                    address.state,
                                style: const TextStyle(
                                    fontFamily: 'din',
                                    fontSize: 14,
                                    color: Color.fromRGBO(125, 125, 123, 1),
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: dp.getAddress().length,
                ),
              ),
              buildRedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrderDonePage(),
                      ));
                },
                title: 'تاكيد',
              )
            ],
          ),
        ),
      ),
    );
  }
}
