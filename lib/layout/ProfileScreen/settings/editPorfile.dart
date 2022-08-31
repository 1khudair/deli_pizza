import 'package:deli_pizza/models/dataProvider.dart';
import 'package:deli_pizza/models/users.dart';
import 'package:deli_pizza/share/components/components.dart';
import 'package:deli_pizza/share/data/dummy.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProfileEdit extends StatelessWidget {
  TextEditingController name =
      TextEditingController(text: DummyData.user.userName);
  TextEditingController phone =
      TextEditingController(text: DummyData.user.userPhone);
  TextEditingController email =
      TextEditingController(text: DummyData.user.userEmail);

  ProfileEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context, listen: true);
    return Scaffold(
      appBar: buildAppBar(
          title: 'تعديل البيانات الشخصية',
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
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color.fromRGBO(235, 234, 239, 1),
                      backgroundImage: AssetImage(DummyData.user.urlImage),
                      radius: 60,
                    ),
                    Positioned(
                      bottom: -20,
                      right: 35,
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            color: Color.fromRGBO(110, 204, 220, 85)),
                        child: IconButton(
                          icon: const Icon(Icons.photo_camera),
                          onPressed: () {},
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                buildTextFormFieldGray(
                    radius: 12, hintText: "اسم المستخدم", controller: name),
                const SizedBox(
                  height: 10,
                ),
                buildTextFormFieldGray(
                    radius: 12, hintText: "رقم الهاتف", controller: phone),
                const SizedBox(
                  height: 10,
                ),
                buildTextFormFieldGray(
                    radius: 12,
                    hintText: "البريد الالكتروني",
                    controller: email),
                const SizedBox(
                  height: 20,
                ),
                buildGreenButton(
                    title: "حفظ",
                    onPressed: () {
                      Users user = Users(
                          basket: [],
                          urlImage: DummyData.user.urlImage,
                          userName: name.text,
                          userEmail: email.text,
                          userPhone: phone.text);
                      dataProvider.editProfile(user);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
