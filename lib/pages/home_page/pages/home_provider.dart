import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_trading/pages/main_page/main_provider.dart';

class HomeProvider extends ChangeNotifier{
  void goToDetailPage(BuildContext context){
    context.read<MainProvider>().pageController.jumpToPage(2);
    notifyListeners();
  }
}