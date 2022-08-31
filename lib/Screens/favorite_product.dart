import 'package:deli_pizza/models/dataProvider.dart';
import 'package:deli_pizza/share/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteProductPage extends StatelessWidget {
  const FavoriteProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataProvider dp = Provider.of<DataProvider>(context);
    return Scaffold(
      appBar: buildAppBar(
          title: 'المنتجات المفضلة',
          action: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_forward_ios,
                  color: Color.fromRGBO(112, 112, 112, 1)))),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 10,
              mainAxisExtent: 290),
          itemBuilder: (context, index) {
            return buildItem(dp.getFavoriteItems()[index], dp);
          },
          itemCount: dp.getFavoriteItems().length,
        ),
      ),
    );
  }
}
