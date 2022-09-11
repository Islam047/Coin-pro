import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_trading/model/order_book_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../../services/log_service/log_service.dart';
import '../../../services/socket_service/socket_service.dart';
import '../animations/wave_ball_painter.dart';
import '../view/items_detail.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

@override
  void initState() {
  SocketService.channel = WebSocketChannel.connect(
    Uri.parse(SocketService.SERVER),
  );
  SocketService.connectSocketChannel(
    subscribe: 'subscribe',
    type: 'orderbook',
  );
  LogService.w(" Detail initState Worked");
  super.initState();
  }
  @override
  void deactivate() {
    LogService.w("Detail deactivate Worked");
    SocketService.channel.sink.close();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 100,
                      width: 130,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.deepPurple,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.fact_check_rounded)),
                              ),
                              const Text(
                                "17",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          ),
                          const Text(
                            "Total transactions\nthis week",
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 100,
                      width: 130,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Send",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.send,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
                const WaveBall(
                  circleColor: Colors.black,
                  progress: 0.6,
                  child: Center(
                    child: Text(
                      '60%\nLimit',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Charts',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(
                  'See all',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ],
            ),
            StreamProvider<OrderBookModel>(
              initialData: OrderBookModel(),
              create: (context) => SocketService.getStreamOfMyOrder(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  ItemsOfDetail(
                      iconData: Icons.currency_bitcoin,
                      title: "Bitcoin",
                      number: 0),
                  ItemsOfDetail(
                      iconData: Icons.currency_ruble,
                      title: "Ruble",
                      number: 1),
                  ItemsOfDetail(
                      iconData: Icons.currency_yuan_rounded,
                      title: "Yuan",
                      number: 2),
                  ItemsOfDetail(
                      iconData: Icons.currency_franc,
                      title: "Franc",
                      number: 3),
                ],
              ),
            )
          ],
        ),
      ),
    ),);
  }
}

