import 'dart:math';

import 'package:flutter/material.dart';

class AnimBarItem extends StatelessWidget {
  final String title;
  final String number;
  const AnimBarItem({Key? key, required this.title, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 200,
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 3,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                color: Colors.blueAccent,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
                width: 20,
                height: Random().nextInt(120).toDouble(),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.topCenter,
              child: AnimatedContainer(
                color: Colors.grey.shade200,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
                width: 20,
                height: double.parse(number),
              ),
            ),
          ),
          Text(title,style: const TextStyle(overflow: TextOverflow.ellipsis,color: Colors.white),)
        ],
      ),
    );
  }
}