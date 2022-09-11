import 'dart:convert';
import 'package:flutter/material.dart';
import '../../model/coin_model.dart';
import '../../services/network_service/network_service.dart';

class RecentInfoProvider extends ChangeNotifier {
  List<Coins>? list = [];
  late CoinModelJson json;
  Stats? stats;
  bool isLoading = false;

  Future<void> getAllData() async {
    Map? response = await NetworkService.GET();
    json = coinModelJsonFromJson(jsonEncode(response));
    stats = json.data!.stats;
    list = json.data!.coins;
    isLoading = false;
    notifyListeners();
  }
}
