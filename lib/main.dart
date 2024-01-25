// import 'package:bitcoin_demo_app/providers/btc_price_provider.dart';
// import 'package:bitcoin_demo_app/providers/btc_historical_price_provider.dart';
// import 'package:bitcoin_demo_app/screens/home_page.dart';
// import 'package:bitcoin_demo_app/screens/profile.dart';
// import "package:flutter/material.dart";
// import "package:provider/provider.dart";

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

// @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => BitcoinPriceProvider()),
//         ChangeNotifierProvider(create: (context) => BitcoinHistoricalPriceProvider()), // Add the new provider
//       ],
//       child: const MaterialApp(
//         home: RootPage(),
//         title: "Bitcoin Demo App",
//         debugShowCheckedModeBanner: false,
//       ),
//     );
//   }
// }

// class RootPage extends StatefulWidget {
//   const RootPage({Key? key}) : super(key: key);

//   @override
//   State<RootPage> createState() => _RootPageState();
// }

// class _RootPageState extends State<RootPage> {
//   int currentPage = 0;

//   @override
//   Widget build(BuildContext context) {
//     final List pages = [
//       const HomePage(),
//       const ProfilePage()
//     ];
//     return Scaffold(
//       body: pages[currentPage],
//       bottomNavigationBar: NavigationBar(
//           destinations: const [
//             NavigationDestination(icon: Icon(Icons.home), label: "Home"),
//             NavigationDestination(
//                 icon: Icon(Icons.person), label: "Profile"),
//           ],
//           onDestinationSelected: (int index) {
//             setState(() {
//               currentPage = index;
//             });
//           },
//           selectedIndex: currentPage),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:bitcoin_demo_app/app/app.bottomsheets.dart';
import 'package:bitcoin_demo_app/app/app.dialogs.dart';
import 'package:bitcoin_demo_app/app/app.locator.dart';
import 'package:bitcoin_demo_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
