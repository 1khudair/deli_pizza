import 'package:deli_pizza/layout/ProfileScreen/settings/changelanguage.dart';
import 'package:deli_pizza/layout/ProfileScreen/settings/changepassword.dart';

import 'package:deli_pizza/share/components/components.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: buildAppBar(
          title: 'الاعدادات',
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
                buildProfileTile(
                  title: "تغيير كلمة المرور",
                  iconData: Icons.arrow_back_ios_new,
                  onTap: () {
                    pushNewScreen(context, screen: const PasswordPage());
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                buildProfileTile(
                  title: "تغيير اللغة",
                  iconData: Icons.arrow_back_ios_new,
                  onTap: () {
                    pushNewScreen(context, screen: const LanguagesPage());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
