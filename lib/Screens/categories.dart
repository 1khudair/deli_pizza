import 'package:deli_pizza/models/dataProvider.dart';
import 'package:deli_pizza/models/screens.dart';
import 'package:deli_pizza/share/components/components.dart';
import 'package:deli_pizza/share/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataProvider dp = Provider.of<DataProvider>(context);
    return Scaffold(
      appBar: buildAppBar(
          title: 'التصنيفات',
          action: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_forward_ios,
                  color: Color.fromRGBO(112, 112, 112, 1)))),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SearchField(hintText: "ابحث عن منتج ، إلخ"),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return InkWell(
                    child: buildCategory(dp.getCategories()[index], dp),
                    onTap: () {
                      dp.selectCategory(
                          categoryId: dp.getCategories()[index].id);
                      dp.selectCategoryIndex(categoryIndex: index);
                      pushNewScreen(context, screen: Products());
                    },
                  );
                },
                itemCount: dp.getCategories().length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
