import 'package:bukit_vista_app/model.dart';
import 'package:bukit_vista_app/page/detail_page.dart';
import 'package:bukit_vista_app/page/homepage.dart';
import 'package:bukit_vista_app/page/list_guest.dart';
import 'package:bukit_vista_app/page/notif_page.dart';
import 'package:bukit_vista_app/page/setting.dart';
import 'package:bukit_vista_app/page/wallet_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guest App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName : (context) => const HomePage(),
        ListGuest.routeName : (context) => const ListGuest(),
        WalletPage.routeName : (context) => const WalletPage(),
        NotificationPage.routeName : (context) => const NotificationPage(),
        SettingPage.routeName : (context) => const SettingPage(),
        DetailPage.routeName : (context) => DetailPage(
            guest: ModalRoute.of(context)?.settings.arguments as Guest
        )
      },
    );
  }
}


