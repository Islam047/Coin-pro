import 'dart:convert';
CoinModelJson coinModelJsonFromJson(String str) => CoinModelJson.fromJson(json.decode(str));
String coinModelJsonToJson(CoinModelJson data) => json.encode(data.toJson());
class CoinModelJson {
  CoinModelJson({
    this.status,
    this.data,});

  CoinModelJson.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
    this.stats,
    this.coins,});

  Data.fromJson(dynamic json) {
    stats = json['stats'] != null ? Stats.fromJson(json['stats']) : null;
    if (json['coins'] != null) {
      coins = [];
      json['coins'].forEach((v) {
        coins?.add(Coins.fromJson(v));
      });
    }
  }
  Stats? stats;
  List<Coins>? coins;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (stats != null) {
      map['stats'] = stats?.toJson();
    }
    if (coins != null) {
      map['coins'] = coins?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Coins coinsFromJson(String str) => Coins.fromJson(json.decode(str));
String coinsToJson(Coins data) => json.encode(data.toJson());
class Coins {
  Coins({
    this.uuid,
    this.symbol,
    this.name,
    this.color,
    this.iconUrl,
    this.marketCap,
    this.price,
    this.listedAt,
    this.tier,
    this.change,
    this.rank,
    this.sparkline,
    this.lowVolume,
    this.coinrankingUrl,
    this.hVolume,
    this.btcPrice,});

  Coins.fromJson(dynamic json) {
    uuid = json['uuid'];
    symbol = json['symbol'];
    name = json['name'];
    color = json['color'];
    iconUrl = json['iconUrl'];
    marketCap = json['marketCap'];
    price = json['price'];
    listedAt = json['listedAt'];
    tier = json['tier'];
    change = json['change'];
    rank = json['rank'];
    sparkline = json['sparkline'] != null ? json['sparkline'].cast<String>() : [];
    lowVolume = json['lowVolume'];
    coinrankingUrl = json['coinrankingUrl'];
    hVolume = json['24hVolume'];
    btcPrice = json['btcPrice'];
  }
  String? uuid;
  String? symbol;
  String? name;
  String? color;
  String? iconUrl;
  String? marketCap;
  String? price;
  num? listedAt;
  num? tier;
  String? change;
  num? rank;
  List<String>? sparkline;
  bool? lowVolume;
  String? coinrankingUrl;
  String? hVolume;
  String? btcPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = uuid;
    map['symbol'] = symbol;
    map['name'] = name;
    map['color'] = color;
    map['iconUrl'] = iconUrl;
    map['marketCap'] = marketCap;
    map['price'] = price;
    map['listedAt'] = listedAt;
    map['tier'] = tier;
    map['change'] = change;
    map['rank'] = rank;
    map['sparkline'] = sparkline;
    map['lowVolume'] = lowVolume;
    map['coinrankingUrl'] = coinrankingUrl;
    map['24hVolume'] = hVolume;
    map['btcPrice'] = btcPrice;
    return map;
  }

}

Stats statsFromJson(String str) => Stats.fromJson(json.decode(str));
String statsToJson(Stats data) => json.encode(data.toJson());
class Stats {
  Stats({
    this.total,
    this.totalCoins,
    this.totalMarkets,
    this.totalExchanges,
    this.totalMarketCap,
    this.total24hVolume,});

  Stats.fromJson(dynamic json) {
    total = json['total'];
    totalCoins = json['totalCoins'];
    totalMarkets = json['totalMarkets'];
    totalExchanges = json['totalExchanges'];
    totalMarketCap = json['totalMarketCap'];
    total24hVolume = json['total24hVolume'];
  }
  num? total;
  num? totalCoins;
  num? totalMarkets;
  num? totalExchanges;
  String? totalMarketCap;
  String? total24hVolume;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['totalCoins'] = totalCoins;
    map['totalMarkets'] = totalMarkets;
    map['totalExchanges'] = totalExchanges;
    map['totalMarketCap'] = totalMarketCap;
    map['total24hVolume'] = total24hVolume;
    return map;
  }

}