import 'dart:math';
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

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<AnimationController> controller = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      this.loaddata();
    });

    int num =
        Provider.of<loadData_Provider>(context, listen: false).universe.length;

    for (int i = 0; i < num; i++) {
      controller.add(
        AnimationController(
          vsync: this,
          duration: Duration(
            seconds: 2,
          ),
          lowerBound: 0,
          upperBound: 2 * pi,
        ),
      );
    }
  }

  loaddata() async {
    await Provider.of<loadData_Provider>(context, listen: false).loadData();
  }

  @override
  void dispose() {
    super.dispose();
    Navigator.of(context)
        .pushAndRemoveUntil('/' as Route<Object?>, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      key: _scaffoldKey,
      backgroundColor: CupertinoColors.systemGrey2,
      child: (Provider.of<loadData_Provider>(context).universe.isNotEmpty &&
              Provider.of<loadData_Provider>(context)
                  .universe[0]
                  .image
                  .isNotEmpty)
          ? (Provider.of<ExplictMode_Provider>(context).explict.isExplict)
              ? (Provider.of<GridViewMode_Provider>(context)
                      .gridViewMode_Model
                      .isGrid)
                  ? grid()
                  : grid()
              : (Provider.of<GridViewMode_Provider>(context)
                      .gridViewMode_Model
                      .isGrid)
                  ? CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          backgroundColor:
                              CupertinoColors.black.withOpacity(0.5),
                          leading: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.app_badge_fill,
                              color: CupertinoColors.white,
                            ),
                          ),
                          actions: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('setting_page');
                              },
                              icon: Icon(
                                CupertinoIcons.settings,
                                color: CupertinoColors.white,
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
                            background: (Provider.of<DarkMode_Provider>(context)
                                        .darkMode_Model
                                        .isDark ==
                                    false)
                                ? Image.asset(
                                    "assests/home_page_image/galaxy.jpg",
                                    fit: BoxFit.cover)
                                : Image.asset(
                                    "assests/home_page_image/flex_image.jpeg",
                                    fit: BoxFit.cover),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            padding: EdgeInsets.all(2.h),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assests/details_image/white.jpeg"),
                                  fit: BoxFit.cover),
                            ),
                            child: Column(
                              children: [
                                GridView.builder(
                                  itemCount: Provider.of<loadData_Provider>(
                                          context,
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
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          'details_page',
                                          arguments:
                                              Provider.of<loadData_Provider>(
                                                      context,
                                                      listen: false)
                                                  .universe[i],
                                        );
                                      },
                                      child: Container(
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
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: CupertinoColors.black,
                                              ),
                                              child: TweenAnimationBuilder(
                                                tween: Tween<double>(
                                                  begin: 0,
                                                  end: 1,
                                                ),
                                                duration: Duration(seconds: 2),
                                                child: CircleAvatar(
                                                  radius: 7.h,
                                                  foregroundImage: AssetImage(
                                                    Provider.of<loadData_Provider>(
                                                            context)
                                                        .universe[i]
                                                        .image,
                                                  ),
                                                ),
                                                builder:
                                                    (context, val, widget) {
                                                  return Transform.scale(
                                                    scale: val,
                                                    child: widget,
                                                  );
                                                },
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
                                                            ? TextThemes
                                                                .textStyleDark
                                                            : TextThemes
                                                                .textStyleLight,
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
                                                            ? TextThemes
                                                                .textStyleDark
                                                                .copyWith(
                                                                fontSize: 1.5.h,
                                                              )
                                                            : TextThemes
                                                                .textStyleLight
                                                                .copyWith(
                                                                color: CupertinoColors
                                                                    .systemPurple,
                                                                fontSize: 1.5.h,
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
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          backgroundColor:
                              CupertinoColors.black.withOpacity(0.5),
                          leading: IconButton(
                            onPressed: () {
                              print(Provider.of<loadData_Provider>(context,
                                      listen: false)
                                  .universe[0]
                                  .favourite);
                              print(Provider.of<loadData_Provider>(context,
                                      listen: false)
                                  .universe[1]
                                  .favourite);
                              print(Provider.of<loadData_Provider>(context,
                                      listen: false)
                                  .universe[2]
                                  .favourite);
                              print(Provider.of<loadData_Provider>(context,
                                      listen: false)
                                  .universe[3]
                                  .favourite);
                              print(Provider.of<loadData_Provider>(context,
                                      listen: false)
                                  .universe[4]
                                  .favourite);
                              print(Provider.of<loadData_Provider>(context,
                                      listen: false)
                                  .universe[5]
                                  .favourite);
                              print(Provider.of<loadData_Provider>(context,
                                      listen: false)
                                  .universe[6]
                                  .favourite);
                              print(Provider.of<loadData_Provider>(context,
                                      listen: false)
                                  .universe[7]
                                  .favourite);
                              print(Provider.of<loadData_Provider>(context,
                                      listen: false)
                                  .universe[8]
                                  .favourite);
                              print(Provider.of<loadData_Provider>(context,
                                      listen: false)
                                  .universe[9]
                                  .favourite);
                              print(Provider.of<loadData_Provider>(context,
                                      listen: false)
                                  .universe[10]
                                  .favourite);
                              print(Provider.of<loadData_Provider>(context,
                                      listen: false)
                                  .universe[11]
                                  .favourite);
                              print(Provider.of<loadData_Provider>(context,
                                      listen: false)
                                  .universe[12]
                                  .favourite);
                              print(Provider.of<loadData_Provider>(context,
                                      listen: false)
                                  .universe[13]
                                  .favourite);
                              print(Provider.of<loadData_Provider>(context,
                                      listen: false)
                                  .universe[14]
                                  .favourite);
                              print(Provider.of<loadData_Provider>(context,
                                      listen: false)
                                  .universe[15]
                                  .favourite);
                            },
                            icon: Icon(
                              CupertinoIcons.app_badge_fill,
                              color: CupertinoColors.white,
                            ),
                          ),
                          actions: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('setting_page');
                              },
                              icon: Icon(
                                CupertinoIcons.settings,
                                color: CupertinoColors.white,
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
                            background: (Provider.of<DarkMode_Provider>(context)
                                        .darkMode_Model
                                        .isDark ==
                                    false)
                                ? Image.asset(
                                    "assests/home_page_image/galaxy.jpg",
                                    fit: BoxFit.cover)
                                : Image.asset(
                                    "assests/home_page_image/flex_image.jpeg",
                                    fit: BoxFit.cover),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            padding: EdgeInsets.all(2.h),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assests/details_image/white.jpeg"),
                                  fit: BoxFit.cover),
                            ),
                            child: Column(
                              children: [
                                GridView.builder(
                                  itemCount: Provider.of<loadData_Provider>(
                                          context,
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
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          'details_page',
                                          arguments:
                                              Provider.of<loadData_Provider>(
                                                      context,
                                                      listen: false)
                                                  .universe[i],
                                        );
                                      },
                                      child: Container(
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
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: CupertinoColors.black,
                                              ),
                                              child: TweenAnimationBuilder(
                                                tween: Tween<double>(
                                                  begin: 0,
                                                  end: 1,
                                                ),
                                                duration: Duration(seconds: 2),
                                                child: CircleAvatar(
                                                  radius: 7.h,
                                                  foregroundImage: AssetImage(
                                                    Provider.of<loadData_Provider>(
                                                            context)
                                                        .universe[i]
                                                        .image,
                                                  ),
                                                ),
                                                builder:
                                                    (context, val, widget) {
                                                  return Transform.scale(
                                                    scale: val,
                                                    child: widget,
                                                  );
                                                },
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
                                                            ? TextThemes
                                                                .textStyleDark
                                                            : TextThemes
                                                                .textStyleLight,
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
                                                            ? TextThemes
                                                                .textStyleDark
                                                                .copyWith(
                                                                fontSize: 1.5.h,
                                                              )
                                                            : TextThemes
                                                                .textStyleLight
                                                                .copyWith(
                                                                color: CupertinoColors
                                                                    .systemPurple,
                                                                fontSize: 1.5.h,
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

  Widget grid() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: CupertinoColors.black.withOpacity(0.5),
          leading: IconButton(
            onPressed: null,
            icon: Icon(
              CupertinoIcons.app_badge_fill,
              color: CupertinoColors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('setting_page');
                print(controller.length);
              },
              icon: Icon(
                CupertinoIcons.settings,
                color: CupertinoColors.white,
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
            background: (Provider.of<DarkMode_Provider>(context)
                        .darkMode_Model
                        .isDark ==
                    false)
                ? Image.asset("assests/home_page_image/galaxy.jpg",
                    fit: BoxFit.cover)
                : Image.asset("assests/home_page_image/flex_image.jpeg",
                    fit: BoxFit.cover),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.all(2.h),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: (Provider.of<DarkMode_Provider>(context)
                          .darkMode_Model
                          .isDark)
                      ? AssetImage("assests/details_image/dark.png")
                      : AssetImage("assests/details_image/white.jpeg"),
                  fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                GridView.builder(
                  itemCount:
                      Provider.of<loadData_Provider>(context, listen: false)
                          .universe
                          .length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          'details_page',
                          arguments: Provider.of<loadData_Provider>(context,
                                  listen: false)
                              .universe[i],
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: CupertinoColors.white,
                          borderRadius: BorderRadius.circular(
                            2.h,
                          ),
                        ),
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Container(
                                  height: 15.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: CupertinoColors.black,
                                  ),
                                  child: AnimatedBuilder(
                                    animation: controller[i],
                                    child: CircleAvatar(
                                      radius: 7.h,
                                      foregroundImage: AssetImage(
                                        Provider.of<loadData_Provider>(context)
                                            .universe[i]
                                            .image,
                                      ),
                                    ),
                                    builder: (context, widget) {
                                      return Transform.rotate(
                                        angle: controller[i].value,
                                        child: widget,
                                      );
                                    },
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    controller[i].forward(from: 1);
                                  },
                                  icon: Icon(
                                    CupertinoIcons.play_circle,
                                  ),
                                ),
                                Positioned(
                                  left: 34.w,
                                  child: IconButton(
                                    onPressed: () {
                                      controller[i].stop();
                                    },
                                    icon: Icon(
                                      CupertinoIcons.stop_circle,
                                    ),
                                  ),
                                ),
                              ],
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
                                        Provider.of<loadData_Provider>(context)
                                            .universe[i]
                                            .name,
                                        style: (Provider.of<DarkMode_Provider>(
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
                                        Provider.of<loadData_Provider>(context)
                                            .universe[i]
                                            .type,
                                        style: (Provider.of<DarkMode_Provider>(
                                                    context)
                                                .darkMode_Model
                                                .isDark)
                                            ? TextThemes.textStyleDark.copyWith(
                                                color: CupertinoColors
                                                    .systemPurple,
                                                fontSize: 1.5.h,
                                              )
                                            : TextThemes.textStyleLight
                                                .copyWith(
                                                color: CupertinoColors
                                                    .systemPurple,
                                                fontSize: 1.5.h,
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
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
