import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:universe/controller/controller_provider.dart';
import 'package:universe/model/utils.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
           CupertinoSliverNavigationBar(
            leading: Icon(CupertinoIcons.person_2),
            largeTitle: Text(
              'Developer',
              style: TextStyle(
                color: (Provider.of<DarkMode_Provider>(context).darkMode_Model.isDark)?CupertinoColors.white:CupertinoColors.black,
              ),
            ),
            trailing: Icon(CupertinoIcons.add_circled),
          ),
          SliverFillRemaining(
            child: Container(
              color: (Provider.of<DarkMode_Provider>(context).darkMode_Model.isDark)?CupertinoColors.black:CupertinoColors.white,
              padding: EdgeInsets.all(2.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "APPEARANCE",
                        style: (Provider.of<
                            DarkMode_Provider>(
                            context)
                            .darkMode_Model
                            .isDark)
                            ? TextThemes
                            .textStyleDark.copyWith(color: CupertinoColors.white)
                            : TextThemes
                            .textStyleLight,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Card(
                    child: CupertinoListTile(
                      title:  Text(
                        "Dark Apperarance",
                        style: TextStyle(
                          color: (Provider.of<DarkMode_Provider>(context).darkMode_Model.isDark)?CupertinoColors.white:CupertinoColors.black,
                        ),
                      ),
                      trailing: CupertinoSwitch(
                        value: Provider.of<DarkMode_Provider>(context)
                            .darkMode_Model
                            .isDark,
                        onChanged: (val) {
                          Provider.of<DarkMode_Provider>(context, listen: false)
                              .AlternateValue();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Card(
                    child: CupertinoListSection(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Provider.of<DarkMode_Provider>(context).darkMode_Model.isDark?Colors.grey.shade900:Colors.white.withOpacity(0.5),
                      ),
                      header: const Text("DISPLAY VIEW"),
                      footer: Text(
                        "Choose a view for iphone. Zoomed shadows larger controls. Standart shows more content.",
                        style: (Provider.of<DarkMode_Provider>(context)
                                .darkMode_Model
                                .isDark)
                            ? TextThemes.textStyleDark.copyWith(
                                color: CupertinoColors.systemGrey2,
                                fontSize: 1.5.h,
                              )
                            : TextThemes.textStyleLight.copyWith(
                                color: CupertinoColors.systemGrey2,
                                fontSize: 1.5.h,
                              ),
                      ),
                      children: [
                        CupertinoListTile(
                          title:  Text(
                            "View",
                            style: TextStyle(
                              color: (Provider.of<DarkMode_Provider>(context).darkMode_Model.isDark)?CupertinoColors.white:CupertinoColors.black,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Standard",
                                style: TextStyle(
                                  color: (Provider.of<DarkMode_Provider>(context).darkMode_Model.isDark)?CupertinoColors.white:CupertinoColors.black,
                                ),
                              ),
                              const IconButton(
                                onPressed: null,
                                icon: Icon(
                                  CupertinoIcons.forward,
                                ),
                              ),
                            ],
                          ),
                        ),
                        CupertinoListTile(
                          title:  Text(
                            "Grid View",
                            style: TextStyle(
                              color: (Provider.of<DarkMode_Provider>(context).darkMode_Model.isDark)?CupertinoColors.white:CupertinoColors.black,
                            ),
                          ),
                          trailing: CupertinoSwitch(
                            value: Provider.of<GridViewMode_Provider>(context)
                                .gridViewMode_Model
                                .isGrid,
                            onChanged: (val) {
                              // style: (Provider.of<DarkMode_Provider>(context)
                              Provider.of<GridViewMode_Provider>(context,
                                      listen: false)
                                  .AlternateValue();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Card(
                    child: CupertinoListSection(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Provider.of<DarkMode_Provider>(context).darkMode_Model.isDark?Colors.grey.shade900:Colors.white.withOpacity(0.5),
                      ),
                      header: const Text("UI AUTOMATION"),
                      children: [
                        CupertinoListTile(
                          title:  Text(
                            "Enabled Explict Animation",
                            style: TextStyle(
                              color: (Provider.of<DarkMode_Provider>(context).darkMode_Model.isDark)?CupertinoColors.white:CupertinoColors.black,
                            ),
                          ),
                          trailing: CupertinoSwitch(
                            value: Provider.of<ExplictMode_Provider>(context)
                                .explict
                                .isExplict,
                            onChanged: (val) {
                              Provider.of<ExplictMode_Provider>(context,
                                      listen: false)
                                  .AlternateValue();
                            },
                          ),
                        ),
                         CupertinoListTile(
                          title: Text(
                            "Multipath NetWorking",
                            style: TextStyle(
                              color: (Provider.of<DarkMode_Provider>(context).darkMode_Model.isDark)?CupertinoColors.white:CupertinoColors.black,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: null,
                            icon: Icon(
                              CupertinoIcons.forward,
                            ),
                          ),
                        ),
                         CupertinoListTile(
                          title: Text(
                            "HTTP/3",
                            style: TextStyle(
                              color: (Provider.of<DarkMode_Provider>(context).darkMode_Model.isDark)?CupertinoColors.white:CupertinoColors.black,
                            ),
                          ),
                          trailing: CupertinoSwitch(
                            value: false,
                            onChanged: null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
