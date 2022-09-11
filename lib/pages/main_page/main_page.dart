import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_trading/pages/recent_info_page/recent_info.dart';
import '../account_page/account_page.dart';
import '../detail_page/pages/detail_page.dart';
import '../home_page/pages/home_page.dart';
import 'main_provider.dart';

class MainPage extends StatelessWidget {
  static const id = "/main_page";

  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainProvider(),
      builder: (context, widget) {
        var mainProvider = Provider.of<MainProvider>(context, listen: false);

        return Scaffold(
          body: PageView(
            onPageChanged: mainProvider.onPageChanged,
            controller: mainProvider.pageController,
            children: const [
              HomePage(),
              ProfilePage(),
              DetailPage(),
              RecentInfo()
            ],
          ),
          bottomNavigationBar:
              Consumer<MainProvider>(builder: (context, main, child) {
            return BottomNavigationBar(
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              currentIndex: main.currentPage,
              onTap: main.onTapNavigatorIcon,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.profile_circled),
                    label: "Profile"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.chart_pie), label: "Detail"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.info),
                    label: "Recent info"),
              ],
            );
          }),
        );
      },
    );
  }
}
