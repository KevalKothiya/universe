import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:universe/controller/controller_provider.dart';
import 'package:universe/model/utils.dart';

class HeartPage extends StatefulWidget {
  const HeartPage({Key? key}) : super(key: key);

  @override
  State<HeartPage> createState() => _HeartPageState();
}

class _HeartPageState extends State<HeartPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: CupertinoColors.black.withOpacity(0.5),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => false);
              },
              icon: Icon(
                CupertinoIcons.home,
                color: CupertinoColors.white,
              ),
            ),
            elevation: 0,
            centerTitle: true,
            pinned: true,
            collapsedHeight: 7.h,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Favourite"),
              collapseMode: CollapseMode.pin,
              background: (Provider.of<DarkMode_Provider>(context)
                          .darkMode_Model
                          .isDark ==
                      false)
                  ? Image.asset("assests/home_page_image/light.jpg",
                      fit: BoxFit.cover)
                  : Image.asset("assests/home_page_image/dark_flex.jpg",
                      fit: BoxFit.cover),
            ),
          ),
          (Provider.of<Favourite_Provider>(context).favourite.isNotEmpty)
              ? SliverToBoxAdapter(
                  child:Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        (Provider.of<DarkMode_Provider>(context)
                                                .darkMode_Model
                                                .isDark)
                                            ? "assests/home_page_image/favourite_dark.jpg"
                                            : "assests/home_page_image/favourite_light.jpg",
                                      ),
                                      fit: BoxFit.cover)),
                              padding: EdgeInsets.all(2.h),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ListView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                            Provider.of<Favourite_Provider>(
                                                    context)
                                                .favourite
                                                .length,
                                        itemBuilder: (context, i) {
                                          return Card(
                                            color: CupertinoColors.systemGrey2
                                                .withOpacity(0.5),
                                            elevation: 5,
                                            margin: EdgeInsets.all(1.h),
                                            shadowColor:
                                                (Provider.of<DarkMode_Provider>(
                                                            context)
                                                        .darkMode_Model
                                                        .isDark)
                                                    ? CupertinoColors
                                                        .systemPurple
                                                    : CupertinoColors.black,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(1.h),
                                                  child: Text(
                                                    Provider.of<Favourite_Provider>(
                                                            context)
                                                        .favourite[i]
                                                        .name,
                                                    style: (Provider.of<
                                                                    DarkMode_Provider>(
                                                                context)
                                                            .darkMode_Model
                                                            .isDark)
                                                        ? TextThemes.textStyleDark
                                                            .copyWith(
                                                            color:
                                                                CupertinoColors
                                                                    .white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 2.5.h,
                                                          )
                                                        : TextThemes
                                                            .textStyleLight
                                                            .copyWith(
                                                                color:
                                                                    CupertinoColors
                                                                        .black,
                                                                fontSize: 2.5.h,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        height: 10.h,
                                                        width: 50.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                                Provider.of<Favourite_Provider>(
                                                                        context)
                                                                    .favourite[
                                                                        i]
                                                                    .image),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        height: 25.h,
                                                        width: double.infinity,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Row(
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          "RADIUS",
                                                                          style: (Provider.of<DarkMode_Provider>(context).darkMode_Model.isDark)
                                                                              ? TextThemes.textStyleDark.copyWith(
                                                                                  color: CupertinoColors.systemGrey2,
                                                                                )
                                                                              : TextThemes.textStyleLight.copyWith(
                                                                                  color: CupertinoColors.systemGrey2,
                                                                                ),
                                                                        ),
                                                                        Text(
                                                                          Provider.of<Favourite_Provider>(context)
                                                                              .favourite[i]
                                                                              .radius,
                                                                          style: (Provider.of<DarkMode_Provider>(context).darkMode_Model.isDark)
                                                                              ? TextThemes.textStyleDark.copyWith(
                                                                                  color: CupertinoColors.white,
                                                                                )
                                                                              : TextThemes.textStyleLight.copyWith(
                                                                                  color: CupertinoColors.black,
                                                                                ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          "ORBITAL PERIOD",
                                                                          style: (Provider.of<DarkMode_Provider>(context).darkMode_Model.isDark)
                                                                              ? TextThemes.textStyleDark.copyWith(
                                                                                  color: CupertinoColors.systemGrey2,
                                                                                )
                                                                              : TextThemes.textStyleLight.copyWith(
                                                                                  color: CupertinoColors.systemGrey2,
                                                                                ),
                                                                        ),
                                                                        Text(
                                                                          Provider.of<Favourite_Provider>(context)
                                                                              .favourite[i]
                                                                              .orbital_period,
                                                                          style: (Provider.of<DarkMode_Provider>(context).darkMode_Model.isDark)
                                                                              ? TextThemes.textStyleDark.copyWith(
                                                                                  color: CupertinoColors.white,
                                                                                )
                                                                              : TextThemes.textStyleLight.copyWith(
                                                                                  color: CupertinoColors.black,
                                                                                ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: Row(
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          "DISTANCE",
                                                                          style: (Provider.of<DarkMode_Provider>(context).darkMode_Model.isDark)
                                                                              ? TextThemes.textStyleDark
                                                                                  .copyWith(
                                                                                    color: CupertinoColors.systemGrey2,
                                                                                  )
                                                                                  .copyWith(
                                                                                    color: CupertinoColors.systemGrey2,
                                                                                  )
                                                                              : TextThemes.textStyleLight.copyWith(
                                                                                  color: CupertinoColors.systemGrey2,
                                                                                ),
                                                                        ),
                                                                        Text(
                                                                          Provider.of<Favourite_Provider>(context)
                                                                              .favourite[i]
                                                                              .distance,
                                                                          style: (Provider.of<DarkMode_Provider>(context).darkMode_Model.isDark)
                                                                              ? TextThemes.textStyleDark.copyWith(
                                                                                  color: CupertinoColors.white,
                                                                                )
                                                                              : TextThemes.textStyleLight.copyWith(
                                                                                  color: CupertinoColors.black,
                                                                                ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          "GRAVITY",
                                                                          style: (Provider.of<DarkMode_Provider>(context).darkMode_Model.isDark)
                                                                              ? TextThemes.textStyleDark.copyWith(
                                                                                  color: CupertinoColors.systemGrey2,
                                                                                )
                                                                              : TextThemes.textStyleLight.copyWith(
                                                                                  color: CupertinoColors.systemGrey2,
                                                                                ),
                                                                        ),
                                                                        Text(
                                                                          Provider.of<Favourite_Provider>(context)
                                                                              .favourite[i]
                                                                              .gravity,
                                                                          style: (Provider.of<DarkMode_Provider>(context).darkMode_Model.isDark)
                                                                              ? TextThemes.textStyleDark.copyWith(
                                                                                  color: CupertinoColors.white,
                                                                                )
                                                                              : TextThemes.textStyleLight.copyWith(
                                                                                  color: CupertinoColors.black,
                                                                                ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        })
                                  ],
                                ),
                              ),
                            ),
                )
              : SliverFillRemaining(
                  child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        (Provider.of<DarkMode_Provider>(context)
                                                .darkMode_Model
                                                .isDark)
                                            ? "assests/home_page_image/favourite_dark.jpg"
                                            : "assests/home_page_image/favourite_light.jpg",
                                      ),
                                      fit: BoxFit.cover)),
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "No Data Founed...",
                                    style: (Provider.of<DarkMode_Provider>(
                                                context)
                                            .darkMode_Model
                                            .isDark)
                                        ? TextThemes.textStyleDark.copyWith(
                                            color: CupertinoColors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 2.5.h,
                                          )
                                        : TextThemes.textStyleLight.copyWith(
                                            color: CupertinoColors.white,
                                            fontSize: 2.5.h,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                ),
          // SliverToBoxAdapter(
          //   child:
          //       (Provider.of<Favourite_Provider>(context).favourite.isNotEmpty)
          //           ? Container(
          //               decoration: BoxDecoration(
          //                   image: DecorationImage(
          //                       image: AssetImage(
          //                         (Provider.of<DarkMode_Provider>(context)
          //                                 .darkMode_Model
          //                                 .isDark)
          //                             ? "assests/home_page_image/favourite_dark.jpg"
          //                             : "assests/home_page_image/favourite_light.jpg",
          //                       ),
          //                       fit: BoxFit.cover)),
          //               padding: EdgeInsets.all(2.h),
          //               child: SingleChildScrollView(
          //                 child: Column(
          //                   children: [
          //                     ListView.builder(
          //                         shrinkWrap: true,
          //                         itemCount:
          //                             Provider.of<Favourite_Provider>(context)
          //                                 .favourite
          //                                 .length,
          //                         itemBuilder: (context, i) {
          //                           return Card(
          //                             color: CupertinoColors.systemGrey2
          //                                 .withOpacity(0.5),
          //                             elevation: 5,
          //                             margin: EdgeInsets.all(1.h),
          //                             shadowColor:
          //                                 (Provider.of<DarkMode_Provider>(context)
          //                                         .darkMode_Model
          //                                         .isDark)
          //                                     ? CupertinoColors.systemPurple
          //                                     : CupertinoColors.black,
          //                             child: Column(
          //                               children: [
          //                                 Padding(
          //                                   padding: EdgeInsets.all(1.h),
          //                                   child: Text(
          //                                     Provider.of<Favourite_Provider>(
          //                                             context)
          //                                         .favourite[i]
          //                                         .name,
          //                                     style: (Provider.of<
          //                                                     DarkMode_Provider>(
          //                                                 context)
          //                                             .darkMode_Model
          //                                             .isDark)
          //                                         ? TextThemes.textStyleDark
          //                                             .copyWith(
          //                                             color:
          //                                                 CupertinoColors.white,
          //                                             fontWeight: FontWeight.bold,
          //                                             fontSize: 2.5.h,
          //                                           )
          //                                         : TextThemes.textStyleLight
          //                                             .copyWith(
          //                                                 color: CupertinoColors
          //                                                     .black,
          //                                                 fontSize: 2.5.h,
          //                                                 fontWeight:
          //                                                     FontWeight.bold),
          //                                   ),
          //                                 ),
          //                                 SizedBox(
          //                                   height: 10,
          //                                 ),
          //                                 Row(
          //                                   children: [
          //                                     Expanded(
          //                                       child: Container(
          //                                         height: 10.h,
          //                                         width: 50.w,
          //                                         decoration: BoxDecoration(
          //                                           shape: BoxShape.circle,
          //                                           image: DecorationImage(
          //                                             image: AssetImage(Provider
          //                                                     .of<Favourite_Provider>(
          //                                                         context)
          //                                                 .favourite[i]
          //                                                 .image),
          //                                             fit: BoxFit.cover,
          //                                           ),
          //                                         ),
          //                                       ),
          //                                     ),
          //                                     Expanded(
          //                                       flex: 2,
          //                                       child: Container(
          //                                         height: 25.h,
          //                                         width: double.infinity,
          //                                         child: Column(
          //                                           mainAxisSize:
          //                                               MainAxisSize.min,
          //                                           children: [
          //                                             Expanded(
          //                                               flex: 1,
          //                                               child: Row(
          //                                                 children: [
          //                                                   Expanded(
          //                                                     child: Column(
          //                                                       crossAxisAlignment:
          //                                                           CrossAxisAlignment
          //                                                               .start,
          //                                                       children: [
          //                                                         Text(
          //                                                           "RADIUS",
          //                                                           style: (Provider.of<DarkMode_Provider>(
          //                                                                       context)
          //                                                                   .darkMode_Model
          //                                                                   .isDark)
          //                                                               ? TextThemes
          //                                                                   .textStyleDark
          //                                                                   .copyWith(
          //                                                                   color:
          //                                                                       CupertinoColors.systemGrey2,
          //                                                                 )
          //                                                               : TextThemes
          //                                                                   .textStyleLight
          //                                                                   .copyWith(
          //                                                                   color:
          //                                                                       CupertinoColors.systemGrey2,
          //                                                                 ),
          //                                                         ),
          //                                                         Text(
          //                                                           Provider.of<Favourite_Provider>(
          //                                                                   context)
          //                                                               .favourite[
          //                                                                   i]
          //                                                               .radius,
          //                                                           style: (Provider.of<DarkMode_Provider>(
          //                                                                       context)
          //                                                                   .darkMode_Model
          //                                                                   .isDark)
          //                                                               ? TextThemes
          //                                                                   .textStyleDark
          //                                                                   .copyWith(
          //                                                                   color:
          //                                                                       CupertinoColors.white,
          //                                                                 )
          //                                                               : TextThemes
          //                                                                   .textStyleLight
          //                                                                   .copyWith(
          //                                                                   color:
          //                                                                       CupertinoColors.black,
          //                                                                 ),
          //                                                         ),
          //                                                       ],
          //                                                     ),
          //                                                   ),
          //                                                   Expanded(
          //                                                     child: Column(
          //                                                       crossAxisAlignment:
          //                                                           CrossAxisAlignment
          //                                                               .start,
          //                                                       children: [
          //                                                         Text(
          //                                                           "ORBITAL PERIOD",
          //                                                           style: (Provider.of<DarkMode_Provider>(
          //                                                                       context)
          //                                                                   .darkMode_Model
          //                                                                   .isDark)
          //                                                               ? TextThemes
          //                                                                   .textStyleDark
          //                                                                   .copyWith(
          //                                                                   color:
          //                                                                       CupertinoColors.systemGrey2,
          //                                                                 )
          //                                                               : TextThemes
          //                                                                   .textStyleLight
          //                                                                   .copyWith(
          //                                                                   color:
          //                                                                       CupertinoColors.systemGrey2,
          //                                                                 ),
          //                                                         ),
          //                                                         Text(
          //                                                           Provider.of<Favourite_Provider>(
          //                                                                   context)
          //                                                               .favourite[
          //                                                                   i]
          //                                                               .orbital_period,
          //                                                           style: (Provider.of<DarkMode_Provider>(
          //                                                                       context)
          //                                                                   .darkMode_Model
          //                                                                   .isDark)
          //                                                               ? TextThemes
          //                                                                   .textStyleDark
          //                                                                   .copyWith(
          //                                                                   color:
          //                                                                       CupertinoColors.white,
          //                                                                 )
          //                                                               : TextThemes
          //                                                                   .textStyleLight
          //                                                                   .copyWith(
          //                                                                   color:
          //                                                                       CupertinoColors.black,
          //                                                                 ),
          //                                                         ),
          //                                                       ],
          //                                                     ),
          //                                                   ),
          //                                                 ],
          //                                               ),
          //                                             ),
          //                                             Expanded(
          //                                               flex: 1,
          //                                               child: Row(
          //                                                 children: [
          //                                                   Expanded(
          //                                                     child: Column(
          //                                                       crossAxisAlignment:
          //                                                           CrossAxisAlignment
          //                                                               .start,
          //                                                       children: [
          //                                                         Text(
          //                                                           "DISTANCE",
          //                                                           style: (Provider.of<DarkMode_Provider>(
          //                                                                       context)
          //                                                                   .darkMode_Model
          //                                                                   .isDark)
          //                                                               ? TextThemes
          //                                                                   .textStyleDark
          //                                                                   .copyWith(
          //                                                                     color:
          //                                                                         CupertinoColors.systemGrey2,
          //                                                                   )
          //                                                                   .copyWith(
          //                                                                     color:
          //                                                                         CupertinoColors.systemGrey2,
          //                                                                   )
          //                                                               : TextThemes
          //                                                                   .textStyleLight
          //                                                                   .copyWith(
          //                                                                   color:
          //                                                                       CupertinoColors.systemGrey2,
          //                                                                 ),
          //                                                         ),
          //                                                         Text(
          //                                                           Provider.of<Favourite_Provider>(
          //                                                                   context)
          //                                                               .favourite[
          //                                                                   i]
          //                                                               .distance,
          //                                                           style: (Provider.of<DarkMode_Provider>(
          //                                                                       context)
          //                                                                   .darkMode_Model
          //                                                                   .isDark)
          //                                                               ? TextThemes
          //                                                                   .textStyleDark
          //                                                                   .copyWith(
          //                                                                   color:
          //                                                                       CupertinoColors.white,
          //                                                                 )
          //                                                               : TextThemes
          //                                                                   .textStyleLight
          //                                                                   .copyWith(
          //                                                                   color:
          //                                                                       CupertinoColors.black,
          //                                                                 ),
          //                                                         ),
          //                                                       ],
          //                                                     ),
          //                                                   ),
          //                                                   Expanded(
          //                                                     child: Column(
          //                                                       crossAxisAlignment:
          //                                                           CrossAxisAlignment
          //                                                               .start,
          //                                                       children: [
          //                                                         Text(
          //                                                           "GRAVITY",
          //                                                           style: (Provider.of<DarkMode_Provider>(
          //                                                                       context)
          //                                                                   .darkMode_Model
          //                                                                   .isDark)
          //                                                               ? TextThemes
          //                                                                   .textStyleDark
          //                                                                   .copyWith(
          //                                                                   color:
          //                                                                       CupertinoColors.systemGrey2,
          //                                                                 )
          //                                                               : TextThemes
          //                                                                   .textStyleLight
          //                                                                   .copyWith(
          //                                                                   color:
          //                                                                       CupertinoColors.systemGrey2,
          //                                                                 ),
          //                                                         ),
          //                                                         Text(
          //                                                           Provider.of<Favourite_Provider>(
          //                                                                   context)
          //                                                               .favourite[
          //                                                                   i]
          //                                                               .gravity,
          //                                                           style: (Provider.of<DarkMode_Provider>(
          //                                                                       context)
          //                                                                   .darkMode_Model
          //                                                                   .isDark)
          //                                                               ? TextThemes
          //                                                                   .textStyleDark
          //                                                                   .copyWith(
          //                                                                   color:
          //                                                                       CupertinoColors.white,
          //                                                                 )
          //                                                               : TextThemes
          //                                                                   .textStyleLight
          //                                                                   .copyWith(
          //                                                                   color:
          //                                                                       CupertinoColors.black,
          //                                                                 ),
          //                                                         ),
          //                                                       ],
          //                                                     ),
          //                                                   ),
          //                                                 ],
          //                                               ),
          //                                             ),
          //                                           ],
          //                                         ),
          //                                       ),
          //                                     ),
          //                                   ],
          //                                 ),
          //                               ],
          //                             ),
          //                           );
          //                         })
          //                   ],
          //                 ),
          //               ),
          //             )
          //           : Container(
          //         decoration: BoxDecoration(
          //             image: DecorationImage(
          //                 image: AssetImage(
          //                   (Provider.of<DarkMode_Provider>(context)
          //                       .darkMode_Model
          //                       .isDark)
          //                       ? "assests/home_page_image/favourite_dark.jpg"
          //                       : "assests/home_page_image/favourite_light.jpg",
          //                 ),
          //                 fit: BoxFit.cover)),
          //               alignment: Alignment.center,
          //               child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   Text(
          //                     "No Data Founed...",
          //                     style: (Provider.of<DarkMode_Provider>(context)
          //                             .darkMode_Model
          //                             .isDark)
          //                         ? TextThemes.textStyleDark.copyWith(
          //                             color: CupertinoColors.white,
          //                             fontWeight: FontWeight.bold,
          //                             fontSize: 2.5.h,
          //                           )
          //                         : TextThemes.textStyleLight.copyWith(
          //                             color: CupertinoColors.white,
          //                             fontSize: 2.5.h,
          //                             fontWeight: FontWeight.bold),
          //                   ),
          //                 ],
          //               ),
          //             ),
          // ),
        ],
      ),
    );
  }
}
