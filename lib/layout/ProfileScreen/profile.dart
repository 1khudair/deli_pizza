import 'package:deli_pizza/models/dataProvider.dart';
import 'package:deli_pizza/models/navbar.dart';
import 'package:deli_pizza/models/screens.dart';
import 'package:deli_pizza/share/components/components.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<NavBar>(context, listen: true);
    final dataProvider = Provider.of<DataProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(5, 20, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color.fromRGBO(235, 234, 239, 1),
                      backgroundImage:
                          AssetImage(dataProvider.getUserData().urlImage),
                      radius: 75,
                    ),
                    Positioned(
                        bottom: 5,
                        right: -2,
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              color: Color.fromRGBO(174, 0, 1, 85)),
                          child: IconButton(
                            icon: const Icon(Icons.photo_camera),
                            onPressed: () {},
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "${dataProvider.getUserData().userName}",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontFamily: "din",
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text("${dataProvider.getUserData().userEmail}",
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontFamily: "din",
                                fontWeight: FontWeight.w400,
                                fontSize: 12)),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Color.fromRGBO(255, 0, 0, 1),
                          ),
                          child: const Icon(
                            Icons.email,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "${dataProvider.getUserData().userPhone}",
                          style: const TextStyle(
                              fontFamily: "din",
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          child: const Icon(
                            Icons.phone_iphone,
                            color: Colors.white,
                            size: 20,
                          ),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Color.fromRGBO(255, 0, 0, 1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    buildProfileTile(
                        iconData: Icons.arrow_back_ios_new,
                        title: "الاعدادات",
                        onTap: () {
                          pushNewScreen(context, screen: const SettingsPage());
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    buildProfileTile(
                        iconData: Icons.arrow_back_ios_new,
                        title: "تعديل الملف الشخصي",
                        onTap: () {
                          pushNewScreen(context, screen: ProfileEdit());
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    buildProfileTile(
                        iconData: Icons.arrow_back_ios_new,
                        title: "المنتجات المفضلة",
                        onTap: () {
                          pushNewScreen(context,
                              screen: const FavoriteProductPage());
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    buildProfileTile(
                        iconData: Icons.arrow_back_ios_new,
                        title: "عناوين التوصيل",
                        onTap: () {
                           dataProvider.addresses.clear();
                          Provider.of<DataProvider>(context, listen: false)
                              .getAddressesFromStore();
                          pushNewScreen(context,
                              screen: const DeliveryAddressPage());
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    buildProfileTile(
                        title: "مشاركة التطبيق",
                        onTap: () {
                          pushNewScreen(context, screen: const ShareAppPage());
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    buildProfileTile(
                        iconData: Icons.arrow_back_ios_new,
                        title: "تواصل معنا",
                        onTap: () {
                          pushNewScreen(context, screen: ContactUsPage());
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    buildProfileTile(
                        iconData: Icons.arrow_back_ios_new,
                        title: "عن التطبيق",
                        onTap: () {
                          pushNewScreen(context, screen: const AboutAppPage());
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    buildRedButton(
                        title: "تسجيل الخروج",
                        onPressed: () {
                          pushNewScreen(context,
                              screen: LoginPage(), withNavBar: false);
                        }),
                    const SizedBox(
                      height: 30,
                    )
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
