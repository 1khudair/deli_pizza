import 'package:deli_pizza/models/dataProvider.dart';
import 'package:deli_pizza/share/components/components.dart';
import 'package:deli_pizza/share/components/constants.dart';
import 'package:deli_pizza/share/data/dummy.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguagesPage extends StatelessWidget {
  const LanguagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context, listen: true);
    return Scaffold(
        appBar: buildAppBar(
          title: 'الاعدادات',
          action: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_forward_ios,
                  color: Color.fromRGBO(112, 112, 112, 1))),
          leading: TextButton(
            onPressed: () {
              data.save();
            },
            child: const Text(
              "حفظ",
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
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
          child: Column(
            children: [
              SearchField(hintText: "ابحث عن اللغة"),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return buildLanguage(
                        languages: DummyData.languages[index],
                        onTap: () {
                          data.selectLanguge(index);
                        });
                  },
                  itemCount: DummyData.languages.length,
                ),
              ),
            ],
          ),
        ));
  }
}
