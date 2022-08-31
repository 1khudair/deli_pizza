import 'package:deli_pizza/models/dataProvider.dart';
import 'package:deli_pizza/share/components/components.dart';
import 'package:deli_pizza/share/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  SearchPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DataProvider dp = Provider.of<DataProvider>(context);
    return Scaffold(
      appBar: buildAppBar(
        title: 'بحث',
        action: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_forward_ios,
                color: Color.fromRGBO(112, 112, 112, 1))),
        leading: TextButton(
          onPressed: () {},
          child: const Text(
            "تطبيق",
            style: TextStyle(
                fontFamily: "din",
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Color.fromRGBO(255, 0, 0, 1)),
          ),
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ))),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SearchField(
              hintText: "ابحث عن منتج ، إلخ",
              prefix: IconButton(
                  onPressed: () {
                    controller.clear();
                  },
                  icon: const Icon(Icons.close)),
              controller: controller,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: buildinfoRow(
                  leading: 'حذف السجل', trailing: 'أخر عمليات البحث'),
            ),
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromRGBO(124, 123, 123, 1), width: 0.2))),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.only(right: 10),
            alignment: Alignment.centerRight,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  textDirection: TextDirection.rtl,
                  children: List.generate(dp.getRecentSearch().length, (index) {
                    return Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: buildRecentSearch(dp.getRecentSearch()[index]));
                  })),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: buildinfoRow(trailing: 'اخر العروض'),
            ),
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromRGBO(124, 123, 123, 1), width: 0.2))),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 290),
              itemBuilder: (context, index) {
                return buildItem(dp.getDicountedItems()[index], dp);
              },
              itemCount: dp.getDicountedItems().length,
            ),
          ),
        ],
      ),
    );
  }
}
