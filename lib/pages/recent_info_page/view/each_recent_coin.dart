import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../model/coin_model.dart';




class SlideAnimation1 extends StatelessWidget {
  final int index;
  final double w;
  final Coins coins;
  const SlideAnimation1({Key? key, required this.index, required this.w, required this.coins}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AnimationConfiguration.staggeredList(
      position: index,
      delay: const Duration(milliseconds: 100),
      child: SlideAnimation(
        duration: const Duration(milliseconds: 2500),
        curve: Curves.fastLinearToSlowEaseIn,
        horizontalOffset: 30,
        verticalOffset: 300.0,
        child: FlipAnimation(
          duration: const Duration(milliseconds: 3000),
          curve: Curves.fastLinearToSlowEaseIn,
          flipAxis: FlipAxis.y,
          child: Container(
            padding: const EdgeInsets.all(15),
            margin: EdgeInsets.only(bottom: w / 20),
            height: w / 4,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 40,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Name: ${coins.name}",style: const TextStyle(color: Colors.blue,fontSize: 20),),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                   Text("Price: ${coins.price.toString().substring(0,6)} \$",style: const TextStyle(color: Colors.black,fontSize: 18),),
                   Text("Rank: ${coins.rank.toString()}",style: const TextStyle(color: Colors.black,fontSize: 18),),
                 ],
                 )

              ],
            )
          ),
        ),
      ),
    );
  }
}