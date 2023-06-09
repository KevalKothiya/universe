import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universe/model/globals.dart';

class DarkMode_Provider extends ChangeNotifier {
  DarkMode_Model darkMode_Model;

  DarkMode_Provider({
    required this.darkMode_Model,
  });

  AlternateValue() async {
    darkMode_Model.isDark = !darkMode_Model.isDark;

    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setBool('isDark', darkMode_Model.isDark);

    notifyListeners();
  }
}

class GridViewMode_Provider extends ChangeNotifier {
  GridViewMode_Model gridViewMode_Model;

  GridViewMode_Provider({
    required this.gridViewMode_Model,
  });

  AlternateValue() async {
    gridViewMode_Model.isGrid = !gridViewMode_Model.isGrid;

    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setBool('isGrid', gridViewMode_Model.isGrid);

    notifyListeners();
  }
}

class ExplictMode_Provider extends ChangeNotifier {
  ExplictMode_Model explict;

  ExplictMode_Provider({
    required this.explict,
  });

  AlternateValue() async {
    explict.isExplict = !explict.isExplict;

    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setBool('isExplict', explict.isExplict);

    notifyListeners();
  }
}

class loadData_Provider extends ChangeNotifier {
  String? data;
  List<Universe_Model> universe = [];

  Future<void> loadData() async {
    data = await rootBundle.loadString("assests/local/universe_details.json");

    List decoded = jsonDecode(data!);

    universe = decoded
        .map(
          (e) => Universe_Model.map(
            data: e,
          ),
        )
        .toList();
  }

  falseToTrue({required int i}) async {
    universe[i].favourite = true;
  }

  trueToFalse({required int i}) async {
    universe[i].favourite = false;
  }
}

class Favourite_Provider extends ChangeNotifier {
  List<Universe_Model> favourite = [];


  addToFavourite({required Universe_Model added}) async {
    favourite.add(added);

    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setStringList('favourite', favourite.cast<String>());

    notifyListeners();
  }
}
