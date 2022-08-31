import 'package:deli_pizza/share/components/components.dart';
import 'package:flutter/material.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          title: 'عن التطبيق',
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
          padding: const EdgeInsetsDirectional.fromSTEB(45, 15, 45, 15),
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
                  height: 40,
                ),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عددإذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عددإذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عددإذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عددإذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد",
                    overflow: TextOverflow.clip,
                    maxLines: 5,
                    softWrap: true,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontFamily: "din",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(79, 79, 79, 1)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildSocialMediaLink(
                        child: Image.asset(
                      'assets/facebook.png',
                      fit: BoxFit.contain,
                    )),
                    buildSocialMediaLink(
                        child: Image.asset(
                      'assets/insta.png',
                      fit: BoxFit.contain,
                    )),
                    buildSocialMediaLink(
                        child: Image.asset(
                      'assets/snap.png',
                      fit: BoxFit.contain,
                    )),
                    buildSocialMediaLink(
                        child: Image.asset(
                      'assets/twitter.png',
                      fit: BoxFit.contain,
                    )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
