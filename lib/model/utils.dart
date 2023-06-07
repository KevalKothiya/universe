import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'globals.dart';


class AppThemes {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: CupertinoColors.white,

  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: Colors.deepPurple,

  );
}

class TextThemes {
  static TextStyle textStyleLight = const TextStyle(
    color: CupertinoColors.black,
    fontSize: 16,
    decoration: TextDecoration.none,
  );

  static TextStyle textStyleDark = const TextStyle(
    color: CupertinoColors.black,
    fontSize: 16,
    decoration: TextDecoration.none,
  );
}


