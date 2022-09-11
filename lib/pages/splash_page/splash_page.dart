import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_trading/pages/main_page/main_page.dart';
import 'package:socket_trading/pages/splash_page/splash_animation_/splash_animation.dart';
import 'package:socket_trading/pages/splash_page/splash_provider.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var provider = Provider.of<SplashPageProvider>(context, listen: false);
    provider.animationSliding();
    Timer(const Duration(milliseconds: 2000), () {
      Navigator.of(context)
          .pushReplacement(SlideTransitionAnimation(const MainPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Consumer<SplashPageProvider>(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 2000),
                curve: Curves.fastLinearToSlowEaseIn,
                width: model.a ? _width : 0,
                height: _height,
                color: Colors.black,
              ),
              const Center(
                child: Text(
                  'Coin Pro',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

