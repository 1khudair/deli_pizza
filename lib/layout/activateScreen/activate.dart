import 'package:deli_pizza/share/components/components.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ActivationPage extends StatelessWidget {
  const ActivationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          title: 'تفعيل الحساب',
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
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: PinCodeTextField(
                      textStyle: const TextStyle(
                          fontFamily: "din",
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.number,
                      pinTheme: const PinTheme.defaults(
                          activeColor: Color.fromARGB(255, 172, 170, 184),
                          inactiveColor: Color.fromRGBO(235, 234, 239, 1),
                          selectedColor: Color.fromRGBO(235, 234, 239, 1)),
                      appContext: context,
                      length: 4,
                      onChanged: (value) {}),
                ),
                buildGreenButton(
                    title: "تفعيل الحساب",
                    onPressed: () {
                      Navigator.popAndPushNamed(context, "login");
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
