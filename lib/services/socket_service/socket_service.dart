import 'dart:async';
import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';

import '../../model/order_book_model.dart';
import '../../model/trade_model.dart';

class SocketService{
  static String SERVER = 'wss://api.hollaex.com/stream';

  static late WebSocketChannel channel;
  static void connectSocketChannel({required String subscribe,required String type}){
    channel.sink.add(
      jsonEncode(
        {
          "op": subscribe,
          "args": [type],
        },
      ),
    );
  }


 static Stream<OrderBookModel>? getStreamOfMyOrder() {

    OrderBookModel model = OrderBookModel();
    SocketService.channel.stream.listen((event) {
      model = orderBookModelFromJson(event as String);
    });
    return Stream<OrderBookModel>.periodic(
        const Duration(seconds: 1), (x) => model);
  }

  static Stream<TradeModel>? getStreamOfMyTrade() {

    TradeModel model = TradeModel();
    SocketService.channel.stream.listen((event) {
      model = tradeModelFromJson(event as String);
    });
    return Stream<TradeModel>.periodic(const Duration(seconds: 1), (x) => model)
      ;
  }


}