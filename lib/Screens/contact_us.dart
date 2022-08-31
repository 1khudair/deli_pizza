import 'package:deli_pizza/share/components/components.dart';
import 'package:deli_pizza/share/data/dummy.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContactUsPage extends StatelessWidget {
  TextEditingController name =
      TextEditingController(text: DummyData.user.userName);
  TextEditingController phone =
      TextEditingController(text: DummyData.user.userPhone);
  TextEditingController email =
      TextEditingController(text: DummyData.user.userEmail);

  ContactUsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          title: 'تواصل معنا',
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/map.png"),
                const SizedBox(
                  height: 15,
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "بيانات التواصل",
                    style: TextStyle(
                        fontFamily: "din",
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                buildTextFormFieldGray(
                    radius: 12, hintText: "اسم المستخدم", controller: name),
                const SizedBox(
                  height: 10,
                ),
                buildTextFormFieldGray(
                    radius: 12,
                    hintText: "البريد الالكتروني",
                    controller: email),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: double.infinity,
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      decoration: InputDecoration(
                        fillColor: const Color.fromRGBO(235, 234, 239, 1),
                        filled: true,
                        enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(9),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(235, 234, 239, 1))),
                        focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(9),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(235, 234, 239, 1))),
                        hintText: "محتوى الرسالة",
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: "din",
                            color: Color.fromRGBO(155, 155, 155, 1)),
                      ),
                    )),
                const SizedBox(
                  height: 15,
                ),
                buildGreenButton(title: "ارسال", onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
