import 'package:deli_pizza/models/category.dart';
import 'package:deli_pizza/models/dataProvider.dart';
import 'package:deli_pizza/models/item.dart';
import 'package:deli_pizza/models/screens.dart';
import 'package:deli_pizza/share/components/components.dart';
import 'package:deli_pizza/share/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataProvider dp = Provider.of<DataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.notifications_none,
            color: Colors.black,
          ),
          onPressed: () {
            pushNewScreen(context, screen: const NotificationsPage());
          },
        ),
        title: Image.asset('assets/homeIcon.png'),
        actions: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    dp.getUserData().userName.toString(),
                    style: const TextStyle(
                        color: Color.fromRGBO(46, 46, 46, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: "din"),
                  ),
                  IconButton(
                      onPressed: () {
                        pushNewScreen(context, screen: ProfileEdit());
                      },
                      icon: CircleAvatar(
                        child: Image.asset(dp.getUserData().urlImage),
                        radius: 15,
                      ))
                ],
              )),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchField(hintText: "ابحث عن منتج ، إلخ"),
              const SizedBox(height: 20),
              Column(
                children: [
                  buildinfoRow(
                      leading: "عرض الكل",
                      trailing: "تصنيفات",
                      onTap: () {
                        pushNewScreen(context, screen: const CategoriesPage());
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: List.generate(
                            dp.getcategoriesHome().length - 1, (index) {
                          Category category = dp.getcategoriesHome()[index];

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  dp.selectCategory(categoryId: category.id);
                                  dp.selectCategoryIndex(categoryIndex: index);
                                  pushNewScreen(context, screen: Products());
                                },
                                child: Image.asset(
                                  category.image,
                                  width: 90,
                                  height: 60,
                                ),
                              ),
                              Text(
                                category.name,
                                style: const TextStyle(
                                    color: Color.fromRGBO(67, 67, 67, 1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "din"),
                              )
                            ],
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  buildinfoRow(
                      leading: "عرض الكل",
                      trailing: "العروض اليومية",
                      onTap: () {
                        pushNewScreen(context,
                            screen: SearchPage(), withNavBar: false);
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      
                      child: Row(
                        children: List.generate(dp.getDicountedItems().length,
                            (index) {
                          Item item = dp.getDicountedItems()[index];
                          return Container(
                            child: buildItem(item, dp),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  buildinfoRow(
                      leading: "عرض الكل",
                      trailing: "المنتجات المفضلة",
                      onTap: () {
                        pushNewScreen(context,
                            screen: const FavoriteProductPage());
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(dp.getFavoriteItems().length,
                            (index) {
                          Item item = dp.getFavoriteItems()[index];
                          return Container(
                            child: buildItem(item, dp),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
