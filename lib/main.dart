import 'package:deli_pizza/country_localizations.dart';
import 'package:deli_pizza/models/auth.dart';
import 'package:deli_pizza/models/checker.dart';
import 'package:deli_pizza/models/dataProvider.dart';
import 'package:deli_pizza/models/navbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'models/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCfWDu2YRM1QXlK2P9czA7kJLAcu9LDj1s",
          appId: "1:314547423331:android:24bc70437a67623b191056",
          messagingSenderId: "314547423331",
          projectId: "deli-pizza-38d7f"));

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Checker(),
      ),
      ChangeNotifierProvider(
        create: (context) => NavBar(),
      ),
      ChangeNotifierProvider(
        create: (context) => DataProvider(),
      ),
      Provider(
        create: (context) => Auth(),
      ),
    ],
    child: const Deli_home(),
  ));
}

class Deli_home extends StatelessWidget {
  const Deli_home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<DataProvider>(context, listen: false).getItemsFromStore();
    return MaterialApp(
      supportedLocales: const [
        Locale("af"),
        Locale("am"),
        Locale("ar"),
        Locale("az"),
        Locale("be"),
        Locale("bg"),
        Locale("bn"),
        Locale("bs"),
        Locale("ca"),
        Locale("cs"),
        Locale("da"),
        Locale("de"),
        Locale("el"),
        Locale("en"),
        Locale("es"),
        Locale("et"),
        Locale("fa"),
        Locale("fi"),
        Locale("fr"),
        Locale("gl"),
        Locale("ha"),
        Locale("he"),
        Locale("hi"),
        Locale("hr"),
        Locale("hu"),
        Locale("hy"),
        Locale("id"),
        Locale("is"),
        Locale("it"),
        Locale("ja"),
        Locale("ka"),
        Locale("kk"),
        Locale("km"),
        Locale("ko"),
        Locale("ku"),
        Locale("ky"),
        Locale("lt"),
        Locale("lv"),
        Locale("mk"),
        Locale("ml"),
        Locale("mn"),
        Locale("ms"),
        Locale("nb"),
        Locale("nl"),
        Locale("nn"),
        Locale("no"),
        Locale("pl"),
        Locale("ps"),
        Locale("pt"),
        Locale("ro"),
        Locale("ru"),
        Locale("sd"),
        Locale("sk"),
        Locale("sl"),
        Locale("so"),
        Locale("sq"),
        Locale("sr"),
        Locale("sv"),
        Locale("ta"),
        Locale("tg"),
        Locale("th"),
        Locale("tk"),
        Locale("tr"),
        Locale("tt"),
        Locale("uk"),
        Locale("ug"),
        Locale("ur"),
        Locale("uz"),
        Locale("vi"),
        Locale("zh")
      ],
      localizationsDelegates: const [
        CountryLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          splash: Image.asset("assets/SplashScreen.png"),
          backgroundColor: const Color.fromRGBO(255, 0, 0, 1),
          centered: true,
          duration: 150,
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          curve: Curves.elasticOut,
          nextScreen: AnimatedSplashScreen(
            splash: Image.asset(
              "assets/SplashHome.png",
            ),
            centered: true,
            duration: 150,
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.fade,
            curve: Curves.elasticOut,
            nextScreen: LoginPage(),
          )),
    );
  }
}
