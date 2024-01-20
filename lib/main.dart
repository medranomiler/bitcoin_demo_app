import "package:bitcoin_demo_app/buy_bitcoin.dart";
import "package:bitcoin_demo_app/home_page.dart";
import "package:flutter/material.dart";

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bitcoin Demo App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
 


  @override
  Widget build(BuildContext context) {
    final List pages = [
      HomePage(),
      BuyBitcoinPage()
    ];
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(

          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(
                icon: Icon(Icons.currency_bitcoin_rounded), label: "Bitcoin"),
          ],
          onDestinationSelected: (int index) {
            setState(() {
              currentPage = index;
              
            });
            
          },
          selectedIndex: currentPage),
    );
  }
}
