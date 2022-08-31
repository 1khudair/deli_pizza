import 'package:deli_pizza/models/address.dart';
import 'package:deli_pizza/models/checker.dart';
import 'package:deli_pizza/models/dataProvider.dart';
import 'package:deli_pizza/share/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewLocationPage extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController region = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController phone = TextEditingController();

  NewLocationPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final checker = Provider.of<Checker>(context);
    final addressProvider = Provider.of<DataProvider>(context);
    return Scaffold(
      appBar: buildAppBar(
          title: 'إضافة عنوان',
          action: IconButton(
              onPressed: () {
                 addressProvider.addresses.clear();
                          Provider.of<DataProvider>(context, listen: false)
                              .getAddressesFromStore();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_forward_ios,
                  color: Color.fromRGBO(112, 112, 112, 1)))),
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(15, 30, 15, 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildTextFormFieldGray(
                  hintText: 'الاسم',
                  radius: 5,
                  controller: name,
                ),
                const SizedBox(
                  height: 10,
                ),
                buildTextFormFieldGray(
                    hintText: 'رقم الجوال', radius: 5, controller: phone),
                const SizedBox(
                  height: 10,
                ),
                buildTextFormFieldGray(
                    hintText: 'اختر اسم المحافظة',
                    radius: 5,
                    prefixIcon: Icons.keyboard_arrow_down,
                    controller: region),
                const SizedBox(
                  height: 10,
                ),
                buildTextFormFieldGray(
                  hintText: 'اختر اسم الولاية',
                  radius: 5,
                  prefixIcon: Icons.keyboard_arrow_down,
                  controller: state,
                ),
                const SizedBox(
                  height: 10,
                ),
                buildTextFormFieldGray(
                  hintText: 'اختر اسم المدينة',
                  radius: 5,
                  prefixIcon: Icons.keyboard_arrow_down,
                  controller: city,
                ),
                const SizedBox(
                  height: 10,
                ),
                buildTextFormFieldGray(
                    hintText: 'اسم الشارع', radius: 5, controller: street),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildNewLocationChecker(
                      value: checker.isHome,
                      label: "المنزل",
                      onChanged: (value) {
                        checker.home();
                      },
                    ),
                    const SizedBox(width: 40),
                    buildNewLocationChecker(
                      value: checker.isOffice,
                      label: "المكتب",
                      onChanged: (value) {
                        checker.office();
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                buildGreenButton(
                    title: "حفظ",
                    onPressed: () {
                      Address address = Address(
                          place: checker.isHome ? "المنزل" : "المكتب",
                          name: name.text,
                          region: region.text,
                          state: state.text,
                          city: city.text,
                          street: street.text,
                          phone: phone.text);

                      addressProvider.addAddressToStore(address);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
