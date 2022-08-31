import 'package:deli_pizza/models/category.dart';
import 'package:deli_pizza/models/dataProvider.dart';
import 'package:deli_pizza/share/components/components.dart';
import 'package:deli_pizza/share/data/dummy.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    DataProvider dp = Provider.of<DataProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 40, 0, 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: List.generate(dp.getCategories().length, (index) {
                    Category category = dp.getCategories()[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: ChoiceChip(
                        label: Text(category.name),
                        selected: index == dp.selectedIndex,
                        backgroundColor: Colors.white,
                        onSelected: (selected) {
                          dp.selectCategoryIndex(categoryIndex: index);
                          dp.selectCategory(categoryId: category.id);
                          Provider.of<DataProvider>(context, listen: false)
                              .getItemsFromStore();
                        },
                        selectedColor: const Color.fromRGBO(228, 111, 38, 1),
                        labelStyle: TextStyle(
                          color: index == dp.selectedIndex
                              ? Colors.white
                              : Colors.black,
                          fontFamily: 'din',
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                        ),
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 15),
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IntrinsicHeight(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.filter_alt_outlined),
                      ),
                      const Text(
                        "فلتر",
                        style: TextStyle(
                            color: Color.fromRGBO(46, 46, 46, 1),
                            fontFamily: 'din',
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                      const VerticalDivider(
                        color: Color.fromRGBO(46, 46, 46, 1),
                        indent: 20,
                        endIndent: 15,
                        width: 10,
                      ),
                      const Text("افضل تقييم",
                          style: TextStyle(
                              color: Color.fromRGBO(228, 111, 38, 1),
                              fontFamily: 'din',
                              fontSize: 17,
                              fontWeight: FontWeight.w400)),
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          size: 15,
                          color: Color.fromRGBO(228, 111, 38, 1),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "منتج",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "din",
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(124, 123, 123, 1)),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        dp.getProducts().length.toString(),
                        style: const TextStyle(
                            fontSize: 15,
                            fontFamily: "din",
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(124, 123, 123, 1)),
                      )
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    mainAxisExtent: 290),
                itemBuilder: (context, index) {
                  return buildItem(dp.getProducts()[index], dp);
                },
                itemCount: dp.getProducts().length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
