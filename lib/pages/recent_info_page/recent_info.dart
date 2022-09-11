import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:socket_trading/pages/recent_info_page/view/each_recent_coin.dart';
import '../detail_page/animations/bar_chart_animation.dart';
import 'recent_info_provider.dart';

class RecentInfo extends StatefulWidget {

  const RecentInfo({Key? key,}) : super(key: key);

  @override
  State<RecentInfo> createState() => _RecentInfoState();
}

class _RecentInfoState extends State<RecentInfo> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RecentInfoProvider>(
      create: (BuildContext context) => RecentInfoProvider(),
      builder: (context, model) {
        var provider = context.read<RecentInfoProvider>();
        provider.isLoading = true;
        double _w = MediaQuery.of(context).size.width;
        provider.getAllData();
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: const CircleAvatar(
              radius: 5,
              backgroundColor: Colors.black,
              child: Icon(
                Icons.info_outline, color: Colors.white, size: 35,),
            ),
            title: const Text(
              'Recent Crypto data',
              style: TextStyle(color: Colors.black),),
            centerTitle: false,
            actions: [
              const Icon(Icons.currency_exchange, color: Colors.black,),
              TextButton(onPressed: () {}, child: const Text("Exchange", style: TextStyle(color: Colors.black),))
            ],
          ),
          body: Stack(

            children: [
              Consumer<RecentInfoProvider>(
                builder: (context, provider, child) {
                  if(provider.isLoading){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  else{
                  return  ListView(
                      children: [
                        const SizedBox(height: 10,),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text("${provider.stats?.totalCoins ?? 0} coins available",style: TextStyle(fontSize: 20),),
                        ),
                        const SizedBox(height: 10,),

                        Container(
                          alignment: Alignment.center,
                          color: Colors.black,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              AnimBarItem(title: provider.list?[0].name ?? ' ', number: provider.list?[0].price?.substring(0,2) ?? '0'),
                              AnimBarItem(title: provider.list?[1].name ?? ' ', number: provider.list?[1].price?.substring(0,2) ?? '0'),
                              AnimBarItem(title: provider.list?[2].name ?? ' ', number: provider.list?[2].price?.substring(0,2) ?? '0'),
                              AnimBarItem(title: provider.list?[3].name ?? ' ', number: provider.list?[3].price?.substring(0,2) ?? '0'),
                              AnimBarItem(title: provider.list?[4].name ?? ' ', number: provider.list?[4].price?.substring(0,2) ?? '0'),
                            ],
                          ),
                        ),
                               Container(
                                 color: Colors.black,
                              height: MediaQuery.of(context).size.height,
                              child: AnimationLimiter(
                               child: ListView.builder(
                                padding: EdgeInsets.all(_w / 30),
                                physics:
                                const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                itemCount: 40,
                                itemBuilder: (context,index){
                                  return SlideAnimation1(index: index, w: _w,coins: provider.list![index],);
                            }),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),

            ],
          ),
        );
      },
    );
  }
}
