import "package:bitcoin_demo_app/btc_price_provider.dart";
import "package:bitcoin_demo_app/btc_historical_price_provider.dart";
import "package:bitcoin_demo_app/home_page.dart";
import "package:bitcoin_demo_app/profile.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

@override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BitcoinPriceProvider()),
        ChangeNotifierProvider(create: (context) => BitcoinHistoricalPriceProvider()), // Add the new provider
      ],
      child: const MaterialApp(
        home: RootPage(),
        title: "Bitcoin Demo App",
        debugShowCheckedModeBanner: false,
      ),
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
      const HomePage(),
      const ProfilePage()
    ];
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(
                icon: Icon(Icons.person), label: "Profile"),
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
