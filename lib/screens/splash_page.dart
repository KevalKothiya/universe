import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:universe/model/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 2),
      () {
        Navigator.pushNamed(context, '/');
      },
    );
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      child: Container(
        child: Column(
          children: [
            Text(
              "KK",
              style: GoogleFonts.rampartOne(
                fontSize: 50,
                color: CupertinoColors.white,
                decoration: TextDecoration.none,
              ),
            ),
            Text(
              "2023 KK, lnc. All right reserved.",
              style: TextThemes.textStyleDark,
            ),
            Text("Starting..", style: TextThemes.textStyleDark),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 6.h,
                    width: 12.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assests/splash_screen_image/unreal.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                      "Unreal Engine CopyRight 1998 - 2023, Epic Games, lnc. All rights reserved.",
                      style: TextThemes.textStyleDark),
                  flex: 6,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
