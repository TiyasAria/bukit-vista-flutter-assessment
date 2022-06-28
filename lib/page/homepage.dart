import 'package:bukit_vista_app/page/list_guest.dart';
import 'package:bukit_vista_app/page/notif_page.dart';
import 'package:bukit_vista_app/page/setting.dart';
import 'package:bukit_vista_app/page/wallet_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/homepage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>>? _pages ;
  int _selectedIndex = 0 ;

  void _onItemTap(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _pages = [
      {
        "pages" : const ListGuest(),
      },
      {
        "pages" : const WalletPage(),
      },
      {
        "pages" : const NotificationPage(),
      },
      {
        "pages" : const SettingPage(),
      },
    ];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages![_selectedIndex]['pages'],
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 30,),
              label: ''
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet, size: 30,),
              label: ''
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications, size: 30,),
              label: "",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 30,),
              label: ''
            ),
          ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap ,
        selectedItemColor: Colors.lightBlueAccent,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
      ),
    );
  }
}
