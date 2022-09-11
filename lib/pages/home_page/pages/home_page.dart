import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_trading/model/order_book_model.dart';
import 'package:socket_trading/pages/home_page/pages/home_provider.dart';
import 'package:socket_trading/services/log_service/log_service.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../../services/socket_service/socket_service.dart';
import '../home_view/each_item_view.dart';
import '../home_view/home_page_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
@override
  void didChangeDependencies(){
  SocketService.channel = WebSocketChannel.connect(
    Uri.parse(SocketService.SERVER),
  );
  SocketService.connectSocketChannel(
    subscribe: 'subscribe',
    type: 'orderbook',
  );
  LogService.w(" Home initState Worked");
  super.didChangeDependencies();
  }

  @override
  void deactivate() {
    LogService.w("Home deactivate Worked");
    SocketService.channel.sink.close();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const HomePageView(),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "My Portfolio",
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                        ChangeNotifierProvider<HomeProvider>(
                          create: (BuildContext context) => HomeProvider(),
                          builder: (context, child) {
                            var homeProvider = Provider.of<HomeProvider>(
                                context,
                                listen: false);

                            return TextButton(
                                onPressed: () =>
                                    homeProvider.goToDetailPage(context),
                                child: const Text("See all"));
                          },
                        )
                      ],
                    ),
                    StreamProvider<OrderBookModel>(
                      initialData: OrderBookModel(),
                      create: (context) => SocketService.getStreamOfMyOrder(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const <Widget>[
                          EachItem(
                            icon: Icons.currency_ruble,
                            index: 0,
                            text: 'Ruble',
                          ),
                          EachItem(
                            icon: Icons.currency_franc,
                            index: 1,
                            text: 'Franc',
                          ),
                          EachItem(
                            icon: Icons.currency_pound,
                            index: 2,
                            text: 'Pound',
                          ),
                          EachItem(
                            icon: Icons.currency_yuan_rounded,
                            index: 3,
                            text: 'Yuan',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
