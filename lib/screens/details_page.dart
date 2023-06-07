import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:universe/controller/controller_provider.dart';
import 'package:universe/model/utils.dart';
import '../model/globals.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with TickerProviderStateMixin {
  late AnimationController controller;


  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: 2 * pi,
      duration: Duration(milliseconds: 50000),
    );

    controller.repeat();
  }


  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Universe_Model data =
        ModalRoute.of(context)!.settings.arguments as Universe_Model;
    return CupertinoPageScaffold(
      child: (Provider.of<ExplictMode_Provider>(context).explict.isExplict)
          ? Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assests/details_image/dark.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 7.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                CupertinoIcons.back,
                                color: CupertinoColors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: (){
                                 data.favourite = !data.favourite;

                                setState(() {});

                                if(data.favourite == true)
                                  {
                                    Provider.of<loadData_Provider>(context,listen: false).falseToTrue(i: data.id);

                                  } else{
                                  Provider.of<loadData_Provider>(context,listen: false).universe[data.id].favourite = false;
                                }

                                if(data.favourite == true)
                                  {
                                    Provider.of<Favourite_Provider>(context,listen: false).addToFavourite(added: data);

                                  }

                              },
                              icon: Icon(
                                CupertinoIcons.heart_fill,
                                color: (data.favourite == false)?CupertinoColors.white:CupertinoColors.destructiveRed,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          data.name,
                          style: (Provider.of<DarkMode_Provider>(context)
                                  .darkMode_Model
                                  .isDark)
                              ? TextThemes.textStyleDark.copyWith(
                                  fontSize: 7.h,
                                  color: CupertinoColors.white,
                                )
                              : TextThemes.textStyleLight.copyWith(
                                  color: CupertinoColors.white,
                                  fontSize: 7.h,
                                ),
                        ),
                        GestureDetector(
                          onTap: () {
                            (controller.isAnimating)
                                ? controller.stop()
                                : controller.forward(from: 1);
                          },
                          onDoubleTap: () {
                            controller.reverse();
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                right: 2.h, left: 2.h, bottom: 2.h),
                            child: AnimatedBuilder(
                              animation: controller,
                              child: CircleAvatar(
                                radius: 25.h,
                                foregroundImage: AssetImage(
                                  data.image,
                                ),
                              ),
                              builder: (context, widget) {
                                return Transform.rotate(
                                  angle: controller.value,
                                  child: widget,
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(2.h),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "RADIUS",
                                      style: (Provider.of<DarkMode_Provider>(
                                                  context)
                                              .darkMode_Model
                                              .isDark)
                                          ? TextThemes.textStyleDark.copyWith(
                                              color:
                                                  CupertinoColors.systemGrey2,
                                            )
                                          : TextThemes.textStyleLight.copyWith(
                                              color:
                                                  CupertinoColors.systemGrey2,
                                            ),
                                    ),
                                    Text(
                                      data.radius,
                                      style: (Provider.of<DarkMode_Provider>(
                                                  context)
                                              .darkMode_Model
                                              .isDark)
                                          ? TextThemes.textStyleDark.copyWith(
                                              color: CupertinoColors.white,
                                            )
                                          : TextThemes.textStyleLight.copyWith(
                                              color: CupertinoColors.white,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "ORBITAL PERIOD",
                                      style: (Provider.of<DarkMode_Provider>(
                                                  context)
                                              .darkMode_Model
                                              .isDark)
                                          ? TextThemes.textStyleDark.copyWith(
                                              color:
                                                  CupertinoColors.systemGrey2,
                                            )
                                          : TextThemes.textStyleLight.copyWith(
                                              color:
                                                  CupertinoColors.systemGrey2,
                                            ),
                                    ),
                                    Text(
                                      data.orbital_period,
                                      style: (Provider.of<DarkMode_Provider>(
                                                  context)
                                              .darkMode_Model
                                              .isDark)
                                          ? TextThemes.textStyleDark.copyWith(
                                              color: CupertinoColors.white,
                                            )
                                          : TextThemes.textStyleLight.copyWith(
                                              color: CupertinoColors.white,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(2.h),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "DISTANCE",
                                      style: (Provider.of<DarkMode_Provider>(
                                                  context)
                                              .darkMode_Model
                                              .isDark)
                                          ? TextThemes.textStyleDark
                                              .copyWith(
                                                color:
                                                    CupertinoColors.systemGrey2,
                                              )
                                              .copyWith(
                                                color:
                                                    CupertinoColors.systemGrey2,
                                              )
                                          : TextThemes.textStyleLight.copyWith(
                                              color:
                                                  CupertinoColors.systemGrey2,
                                            ),
                                    ),
                                    Text(
                                      data.distance,
                                      style: (Provider.of<DarkMode_Provider>(
                                                  context)
                                              .darkMode_Model
                                              .isDark)
                                          ? TextThemes.textStyleDark.copyWith(
                                              color: CupertinoColors.white,
                                            )
                                          : TextThemes.textStyleLight.copyWith(
                                              color: CupertinoColors.white,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "GRAVITY",
                                      style: (Provider.of<DarkMode_Provider>(
                                                  context)
                                              .darkMode_Model
                                              .isDark)
                                          ? TextThemes.textStyleDark.copyWith(
                                              color:
                                                  CupertinoColors.systemGrey2,
                                            )
                                          : TextThemes.textStyleLight.copyWith(
                                              color:
                                                  CupertinoColors.systemGrey2,
                                            ),
                                    ),
                                    Text(
                                      data.gravity,
                                      style: (Provider.of<DarkMode_Provider>(
                                                  context)
                                              .darkMode_Model
                                              .isDark)
                                          ? TextThemes.textStyleDark.copyWith(
                                              color: CupertinoColors.white,
                                            )
                                          : TextThemes.textStyleLight.copyWith(
                                              color: CupertinoColors.white,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(2.h),
                              child: Text(
                                "DETAIL :",
                                style: (Provider.of<DarkMode_Provider>(context)
                                        .darkMode_Model
                                        .isDark)
                                    ? TextThemes.textStyleDark.copyWith(
                                        fontSize: 3.h,
                                        color: CupertinoColors.systemGrey2,
                                      )
                                    : TextThemes.textStyleLight.copyWith(
                                        color: CupertinoColors.systemGrey2,
                                        fontSize: 3.h,
                                      ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(2.h),
                              width: 100.w,
                              child: DefaultTextStyle(
                                style: const TextStyle(
                                  fontSize: 30.0,
                                  fontFamily: 'Agne',
                                ),
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    TypewriterAnimatedText(
                                      data.details,
                                      textStyle: TextStyle(
                                        fontSize: 2.5.h,
                                        color: CupertinoColors.systemGrey5,
                                      ),
                                      speed: Duration(
                                        milliseconds: 50,
                                      ),
                                    ),
                                  ],
                                  totalRepeatCount: 1,
                                  pause: const Duration(milliseconds: 2000),
                                  displayFullTextOnTap: true,
                                  stopPauseOnTap: true,
                                  onTap: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assests/details_image/dark.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 7.h,
                        ),
                        Text(
                          data.name,
                          style: (Provider.of<DarkMode_Provider>(context)
                                  .darkMode_Model
                                  .isDark)
                              ? TextThemes.textStyleDark.copyWith(
                                  fontSize: 7.h,
                                  color: CupertinoColors.white,
                                )
                              : TextThemes.textStyleLight.copyWith(
                                  color: CupertinoColors.white,
                                  fontSize: 7.h,
                                ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              right: 2.h, left: 2.h, bottom: 2.h),
                          child: TweenAnimationBuilder(
                            tween: Tween<double>(
                              begin: 0,
                              end: 2 * pi,
                            ),
                            duration: Duration(seconds: 50),
                            child: CircleAvatar(
                              radius: 25.h,
                              foregroundImage: AssetImage(data.image),
                            ),
                            builder: (context, val, widget) {
                              return Transform.rotate(
                                angle: val,
                                child: widget,
                              );
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(2.h),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "RADIUS",
                                      style: (Provider.of<DarkMode_Provider>(
                                                  context)
                                              .darkMode_Model
                                              .isDark)
                                          ? TextThemes.textStyleDark.copyWith(
                                              color:
                                                  CupertinoColors.systemGrey2,
                                            )
                                          : TextThemes.textStyleLight.copyWith(
                                              color:
                                                  CupertinoColors.systemGrey2,
                                            ),
                                    ),
                                    Text(
                                      data.radius,
                                      style: (Provider.of<DarkMode_Provider>(
                                                  context)
                                              .darkMode_Model
                                              .isDark)
                                          ? TextThemes.textStyleDark.copyWith(
                                              color: CupertinoColors.white,
                                            )
                                          : TextThemes.textStyleLight.copyWith(
                                              color: CupertinoColors.white,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "ORBITAL PERIOD",
                                      style: (Provider.of<DarkMode_Provider>(
                                                  context)
                                              .darkMode_Model
                                              .isDark)
                                          ? TextThemes.textStyleDark.copyWith(
                                              color:
                                                  CupertinoColors.systemGrey2,
                                            )
                                          : TextThemes.textStyleLight.copyWith(
                                              color:
                                                  CupertinoColors.systemGrey2,
                                            ),
                                    ),
                                    Text(
                                      data.orbital_period,
                                      style: (Provider.of<DarkMode_Provider>(
                                                  context)
                                              .darkMode_Model
                                              .isDark)
                                          ? TextThemes.textStyleDark.copyWith(
                                              color: CupertinoColors.white,
                                            )
                                          : TextThemes.textStyleLight.copyWith(
                                              color: CupertinoColors.white,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(2.h),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "DISTANCE",
                                      style: (Provider.of<DarkMode_Provider>(
                                                  context)
                                              .darkMode_Model
                                              .isDark)
                                          ? TextThemes.textStyleDark.copyWith(
                                              color:
                                                  CupertinoColors.systemGrey2,
                                            )
                                          : TextThemes.textStyleLight.copyWith(
                                              color:
                                                  CupertinoColors.systemGrey2,
                                            ),
                                    ),
                                    Text(
                                      data.distance,
                                      style: (Provider.of<DarkMode_Provider>(
                                                  context)
                                              .darkMode_Model
                                              .isDark)
                                          ? TextThemes.textStyleDark.copyWith(
                                              color: CupertinoColors.white,
                                            )
                                          : TextThemes.textStyleLight.copyWith(
                                              color: CupertinoColors.white,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "GRAVITY",
                                      style: (Provider.of<DarkMode_Provider>(
                                                  context)
                                              .darkMode_Model
                                              .isDark)
                                          ? TextThemes.textStyleDark.copyWith(
                                              color:
                                                  CupertinoColors.systemGrey2,
                                            )
                                          : TextThemes.textStyleLight.copyWith(
                                              color:
                                                  CupertinoColors.systemGrey2,
                                            ),
                                    ),
                                    Text(
                                      data.gravity,
                                      style: (Provider.of<DarkMode_Provider>(
                                                  context)
                                              .darkMode_Model
                                              .isDark)
                                          ? TextThemes.textStyleDark.copyWith(
                                              color: CupertinoColors.white,
                                            )
                                          : TextThemes.textStyleLight.copyWith(
                                              color: CupertinoColors.white,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(2.h),
                              child: Text(
                                "DETAIL :",
                                style: (Provider.of<DarkMode_Provider>(context)
                                        .darkMode_Model
                                        .isDark)
                                    ? TextThemes.textStyleDark.copyWith(
                                        fontSize: 3.h,
                                        color: CupertinoColors.systemGrey2,
                                      )
                                    : TextThemes.textStyleLight.copyWith(
                                        color: CupertinoColors.systemGrey2,
                                        fontSize: 3.h,
                                      ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(2.h),
                              width: 100.w,
                              child: DefaultTextStyle(
                                style: const TextStyle(
                                  fontSize: 30.0,
                                  fontFamily: 'Agne',
                                ),
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    TypewriterAnimatedText(
                                      data.details,
                                      textStyle: TextStyle(
                                        fontSize: 2.5.h,
                                        color: CupertinoColors.systemGrey5,
                                      ),
                                      speed: Duration(
                                        milliseconds: 50,
                                      ),
                                    ),
                                  ],
                                  totalRepeatCount: 1,
                                  pause: const Duration(milliseconds: 2000),
                                  displayFullTextOnTap: true,
                                  stopPauseOnTap: true,
                                  onTap: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
