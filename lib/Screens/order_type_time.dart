import 'package:deli_pizza/models/dataProvider.dart';
import 'package:deli_pizza/share/components/components.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'checkout.dart';

class OrderTypeTimePage extends StatelessWidget {
  const OrderTypeTimePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataProvider dp = Provider.of<DataProvider>(context);

    return Scaffold(
      appBar: buildAppBar(
        title: 'وقت التسليم',
      ),
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
                RadioListTile(
                  value: 0,
                  groupValue: dp.receptType,
                  onChanged: (int? value) {
                    dp.setRecept(value);
                  },
                  title: const Text('استلام الطلب الان'),
                  activeColor: const Color.fromRGBO(255, 0, 0, 1),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: dp.receptType == 0
                              ? const Color.fromRGBO(255, 0, 0, 1)
                              : const Color.fromRGBO(155, 155, 155, 1))),
                  toggleable: true,
                ),
                const SizedBox(
                  height: 25,
                ),
                RadioListTile(
                  value: 1,
                  groupValue: dp.receptType,
                  onChanged: (int? value) {
                    dp.setRecept(value);
                  },
                  title: const Text('جدولة الطلب'),
                  activeColor: const Color.fromRGBO(255, 0, 0, 1),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: dp.receptType == 1
                              ? const Color.fromRGBO(255, 0, 0, 1)
                              : const Color.fromRGBO(155, 155, 155, 1))),
                  toggleable: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                dp.receptType == 1
                    ? SizedBox(
                        width: 300,
                        child: buildTextFormFieldGray(
                            hintText: 'ادخل وقت الاستلام'))
                    : const SizedBox.shrink(),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          minimumSize:
                              MaterialStateProperty.all(const Size(120, 40)),
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(64, 212, 0, 1))),
                      onPressed: () {
                        dp.addresses.clear();
                          Provider.of<DataProvider>(context, listen: false)
                              .getAddressesFromStore();
                        pushNewScreen(context, screen: const CheckOutPage());
                      },
                      child: const Text(
                        'تاكيد',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'din',
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
