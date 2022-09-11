import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:socket_trading/pages/main_page/main_page.dart';
import 'package:socket_trading/pages/splash_page/splash_page.dart';
import 'package:socket_trading/pages/splash_page/splash_provider.dart';
import 'package:socket_trading/services/database/hive_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(HiveService.dbName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SplashPageProvider>(
      create: (BuildContext context) => SplashPageProvider(),
      child: MaterialApp(
        title: "Trading Forex",
        theme: ThemeData(),
        home: const SplashPage(),
      ),
    );
  }
}
