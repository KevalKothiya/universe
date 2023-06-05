import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:universe/controller/controller_provider.dart';
import 'package:universe/model/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    Provider.of<loadData_Provider>(context, listen: false).loadData();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey2,
      child: (Provider.of<loadData_Provider>(context).universe.isNotEmpty)
          ? CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: const IconButton(
                    onPressed: null,
                    icon: Icon(
                      CupertinoIcons.app_badge_fill,
                    ),
                  ),
                  actions: const [
                     IconButton(
                      onPressed: null,
                      icon: Icon(
                        CupertinoIcons.settings,
                      ),
                    ),
                  ],
                  elevation: 0,
                  centerTitle: true,
                  pinned: true,
                  expandedHeight: 40.h,
                  collapsedHeight: 7.h,
                  flexibleSpace: FlexibleSpaceBar(
                    title: const Text("Universe"),
                    collapseMode: CollapseMode.pin,
                    // stretchModes: [
                    //   StretchMode.zoomBackground,
                    //   StretchMode.fadeTitle,
                    // ],
                    background: Image.asset(
                        "assests/home_page_image/flex_image.jpeg",
                        fit: BoxFit.cover),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.all(2.h),
                    child: Column(
                      children: [
                        GridView.builder(
                          itemCount: Provider.of<loadData_Provider>(context,
                                  listen: false)
                              .universe
                              .length,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1,
                          ),
                          itemBuilder: (context, i) {
                            return Container(
                              decoration: BoxDecoration(
                                color: CupertinoColors.white,
                                borderRadius: BorderRadius.circular(
                                  2.h,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 15.h,
                                    decoration: BoxDecoration(
                                      color: CupertinoColors.black,
                                      image: DecorationImage(
                                        image: AssetImage(
                                          Provider.of<loadData_Provider>(
                                                  context)
                                              .universe[i]
                                              .image,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(1.h),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 0.5.h,
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            Text(
                                              Provider.of<loadData_Provider>(
                                                      context)
                                                  .universe[i]
                                                  .name,
                                              style: (Provider.of<
                                                              DarkMode_Provider>(
                                                          context)
                                                      .darkMode_Model
                                                      .isDark)
                                                  ? TextThemes.textStyleDark
                                                  : TextThemes.textStyleLight,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 0.5.h,
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            Text(
                                              Provider.of<loadData_Provider>(
                                                      context)
                                                  .universe[i]
                                                  .type,
                                              style: (Provider.of<
                                                              DarkMode_Provider>(
                                                          context)
                                                      .darkMode_Model
                                                      .isDark)
                                                  ? TextThemes.textStyleDark.copyWith(
                                                      fontSize: 1.5.h,
                                                    )
                                                  : TextThemes.textStyleLight.copyWith(
                                                      color: CupertinoColors
                                                          .systemPurple,
                                                      fontSize: 1.5.h,
                                                    ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          : Container(),
    );
  }
}
