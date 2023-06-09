import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:universe/controller/controller_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  List<AnimationController> controller = [];

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
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 10))
        .then((value) => Navigator.of(context).pushReplacementNamed('/'));
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assests/splash_screen_image/d-1.jpg"),
            fit: BoxFit.cover
          ),
        ),
      ),
    );
  }
}
