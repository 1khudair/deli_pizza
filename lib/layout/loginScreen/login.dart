import 'package:country_code_picker/country_code_picker.dart';
import 'package:deli_pizza/layout/navigationScreen/navigation.dart';
import 'package:deli_pizza/layout/registrationScreen/registration.dart';
import 'package:deli_pizza/models/auth.dart';
import 'package:deli_pizza/share/components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  TextEditingController number = TextEditingController();
  String dialCode = "";

  LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: true);
    return Scaffold(
      appBar: buildAppBar(
          title: "تسجيل الدخول",
          action: const IconButton(
              onPressed: null,
              icon: Icon(Icons.arrow_forward_ios,
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
                TextFormField(
                  controller: number,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      fontSize: 16,
                      wordSpacing: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: "din"),
                  decoration: InputDecoration(
                      suffixIcon: CountryCodePicker(
                    initialSelection: "PS",
                    favorite: const ['+970', 'PS'],
                    showCountryOnly: false,
                    showOnlyCountryWhenClosed: false,
                    alignLeft: false,
                    onInit: (code) {
                      dialCode = code!.dialCode!;
                    },
                  )),
                  cursorColor: Colors.black,
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    buildGreenButton(
                        title: "تسجيل الدخول",
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NavigationPage(),
                              ));
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      child: Text(
                        "لا تمتلك حساباََ؟",
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
                        title: "قم بانشاء حسابك الأن",
                        onPressed: () {
                          auth.setNumber(
                              number: int.parse(dialCode + number.text));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegistrationPage(),
                              ));
                        }),
                    const SizedBox(height: 10),
                    buildGrayButton(
                        title: "متابعة بدون تسجيل دخول",
                        onPressed: () async {
                          
                          UserCredential result =
                              await FirebaseAuth.instance.signInAnonymously();

                          
                          
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NavigationPage(),
                              ));
                        }),
                    const SizedBox(height: 10),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
