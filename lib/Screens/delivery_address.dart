import 'package:deli_pizza/models/dataProvider.dart';
import 'package:deli_pizza/share/components/components.dart';
import 'package:deli_pizza/share/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import 'new_location.dart';

class DeliveryAddressPage extends StatelessWidget {
  const DeliveryAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addressProvider = Provider.of<DataProvider>(context);
    
    return Scaffold(
      appBar: buildAppBar(
        title: 'عناوين التوصيل',
        action: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_forward_ios,
              color: Color.fromRGBO(112, 112, 112, 1)),
        ),
        leading: IconButton(
          alignment: Alignment.centerRight,
          icon: Container(
            margin: const EdgeInsets.all(7),
            alignment: Alignment.center,
            child: Image.asset("assets/add.png"),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Color.fromRGBO(255, 0, 0, 1)),
          ),
          onPressed: () {
            pushNewScreen(context, screen: NewLocationPage());
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return buildAddress(
                    address: addressProvider.getAddress()[index]);
              },
              itemCount: addressProvider.getAddress().length,
            )),
      ),
    );
  }
}
