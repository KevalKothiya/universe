import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:universe/controller/controller_provider.dart';
import 'package:universe/model/globals.dart';
import 'package:universe/model/utils.dart';
import 'package:universe/screens/home_page.dart';
import 'package:universe/screens/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();

  bool isDark = await preferences.getBool('isDark') ?? false;
  bool isGrid = await preferences.getBool('isGrid') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DarkMode_Provider(darkMode_Model: DarkMode_Model(isDark: isDark,),),),
        ChangeNotifierProvider(create: (context) => GridViewMode_Provider(gridViewMode_Model: GridViewMode_Model(isGrid: isGrid,),),),
        ChangeNotifierProvider(create: (context) => loadData_Provider(),),
      ],
      builder: (context, child) {
        return Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              themeMode: (Provider
                  .of<DarkMode_Provider>(context)
                  .darkMode_Model
                  .isDark)
                  ? ThemeMode.dark
                  : ThemeMode.light,
              initialRoute: 'splash_screen',
              routes: {
                '/' : (context) => HomePage(),
                'splash_screen' : (context) => SplashScreen(),
              },
            );
          },
        );
      },
    ),
  );
}
