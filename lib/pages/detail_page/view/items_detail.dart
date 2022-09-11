import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_trading/model/order_book_model.dart';
import '../animations/line_chart_animations.dart';

class ItemsOfDetail extends StatelessWidget {
  final IconData iconData;
  final String title;
  final int number;

  const ItemsOfDetail(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderBookModel>(
      builder: (context, provider, child) {
        try {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black,
                  child: Icon(iconData),
                ),
                Column(
                  children: [
                    Text(title),
                    Text('+${Random().nextInt(10)}'),
                  ],
                ),
                SizedBox(
                  height: 100,
                  width: 180,
                  child: LineChartWidget(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text('\$ ${provider.data!.bids![number].toString().substring(1, 4)}')
                  ],
                )
              ],
            ),
          );
        } catch (e) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black,
                  child: Icon(iconData),
                ),
                Column(
                  children: [
                    Text(title),
                    Text('+${Random().nextInt(10)}'),
                  ],
                ),
                SizedBox(
                  height: 100,
                  width: 180,
                  child: LineChartWidget(),
                ),
                const Text('\$ 0')
              ],
            ),
          );
        }
      },
    );
  }
}
