import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/order_book_model.dart';


class EachItem extends StatelessWidget {
  final String text;
  final int index;
  final IconData icon;

  const EachItem({Key? key, required this.text, required this.index, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black,
      ),
      height: 60,
      width: MediaQuery.of(context).size.width - 100,
      child: Consumer<OrderBookModel>(builder: (context, myModel, child) {
        try {
          return ListTile(
            leading:  Icon(
              icon,
              color: Colors.yellow,
              size: 35,
            ),
            title: Text(
              text,
              style: const TextStyle(fontSize: 20,color: Colors.white),
            ),
            trailing: Text(
              '${myModel.data!.bids![index].toString().substring(1, 5)} \$',
              style: const TextStyle(fontSize: 17, color: Colors.red),
            ),
          );
        }
        catch(e){
          return  ListTile(
            leading:  Icon(
              icon,
              color: Colors.yellow,
              size: 35,
            ),
            title: Text(
              text,
              style: const TextStyle(fontSize: 20),
            ),
            trailing: const Text(
              '0 \$',
              style: TextStyle(fontSize: 17, color: Colors.red),
            ),
          );
        }
      }),
    );
  }
}