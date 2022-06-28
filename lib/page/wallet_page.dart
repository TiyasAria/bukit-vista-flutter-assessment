import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);
  static const routeName = '/wallet_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet Page'),
      ),
      body: const Center(
        child: Text("Wallet Page"),
      ),
    );
  }
}
