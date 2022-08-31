import 'package:deli_pizza/layout/activateScreen/activate.dart';
import 'package:deli_pizza/layout/loginScreen/login.dart';
import 'package:deli_pizza/models/auth.dart';
import 'package:deli_pizza/models/checker.dart';
import 'package:deli_pizza/share/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final checker = Provider.of<Checker>(context, listen: true);
    final auth = Provider.of<Auth>(context, listen: true);
    return Scaffold(
      appBar: buildAppBar(
          title: 'انشاء حسابك',
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
                Image.asset(
                  'assets/icon.png',
                  width: 104.59,
                  height: 139.2,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 25,
                ),
                buildTextFormField(
                  hintText: "ادخل اسمك",
                  suffixIcon: Icons.person,
                ),
                const SizedBox(
                  height: 10,
                ),
                buildTextFormField(
                    hintText: "ادخل رقم الهاتف",
                    suffixIcon: Icons.phone_iphone,
                    initialValue: "+" + auth.number.toString()),
                const SizedBox(
                  height: 10,
                ),
                buildTextFormField(
                    hintText: "اختر اسم المحافظة",
                    suffixIcon: Icons.gps_fixed,
                    prefixIcon: Icons.keyboard_arrow_down),
                const SizedBox(
                  height: 10,
                ),
                buildTextFormField(
                    hintText: "اختر اسم الولاية",
                    suffixIcon: Icons.gps_fixed,
                    prefixIcon: Icons.keyboard_arrow_down),
                const SizedBox(
                  height: 10,
                ),
                buildTextFormField(
                    hintText: "اختر اسم المدينة",
                    suffixIcon: Icons.gps_fixed,
                    prefixIcon: Icons.keyboard_arrow_down),
                const SizedBox(
                  height: 30,
                ),
                buildAgreeButton(checker),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    buildGreenButton(
                      title: "تفعيل الحساب",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ActivationPage(),
                            ));
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      child: Text(
                        "هل تمتلك حساباََ؟",
                        style: TextStyle(
                          color: Color.fromRGBO(165, 165, 165, 1),
                          fontSize: 16,
                          fontFamily: "din",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    buildGrayButton(
                        title: "قم بتسجيل الدخول الأن",
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ));
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildAgreeButton(Checker checker) {
    return Row(textDirection: TextDirection.rtl, children: [
      InkWell(
        onTap: () => {checker.agree()},
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border:
                  Border.all(color: const Color.fromRGBO(112, 112, 112, 1))),
          child: CircleAvatar(
            radius: 6,
            backgroundColor: checker.isAgree
                ? const Color.fromRGBO(247, 58, 58, 1)
                : Colors.white,
          ),
        ),
      ),
      const SizedBox(
        width: 3,
      ),
      RichText(
          textDirection: TextDirection.rtl,
          text: const TextSpan(
              text: "أوافق على ",
              style: TextStyle(
                  color: Color.fromRGBO(143, 143, 143, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: "neoSans"),
              children: [
                TextSpan(
                  text: "شروط الخدمة وسياسة الخصوصية",
                  style: TextStyle(
                      color: Color.fromRGBO(175, 0, 0, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: "neoSans"),
                ),
              ]))
    ]);
  }
}
