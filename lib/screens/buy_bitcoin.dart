// import 'dart:async';
// import "package:flutter/material.dart";
// import 'package:bitcoin_demo_app/screens/preview_buy.dart';
// import '../utils/bitcoin_price_api.dart';

// class BuyBitcoinPage extends StatefulWidget {
//   const BuyBitcoinPage({Key? key}) : super(key: key);

//   @override
//   State<BuyBitcoinPage> createState() => _BuyBitcoinPageState();
// }

// class _BuyBitcoinPageState extends State<BuyBitcoinPage> {
//   late int btcPriceApiResponse = 0;
//   late Timer timer;
//   TextEditingController textFieldController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     fetchBitcoinPrice().then((data) {
//       setState(() {
//         btcPriceApiResponse = data;
//       });
//     });

//     timer = Timer.periodic(const Duration(seconds: 60), (Timer t) {
//       fetchBitcoinPrice().then((data) {
//         setState(() {
//           btcPriceApiResponse = data;
//         });
//       });
//     });
//   }

//   @override
//   void dispose() {
//     // Cancel the timer when the widget is disposed
//     timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     isValid(inputValue) {
//       final numericRegex = RegExp(r'^[0-9]+$');

//       if (inputValue.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             action: SnackBarAction(
//               label: 'Error',
//               onPressed: () {
//                 // Code to execute.
//               },
//             ),
//             content: const Text('Amount must be greater than 10.'),
//             duration: const Duration(milliseconds: 1500),
//             width: 280.0, // Width of the SnackBar.
//             padding: const EdgeInsets.symmetric(
//               horizontal: 8.0, // Inner padding for SnackBar content.
//             ),
//             behavior: SnackBarBehavior.floating,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//           ),
//         );
//         return false;
//       } else if (!numericRegex.hasMatch(inputValue)) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             action: SnackBarAction(
//               label: 'Error',
//               onPressed: () {
//                 // Code to execute.
//               },
//             ),
//             content: const Text('Amount must be a number.'),
//             duration: const Duration(milliseconds: 1500),
//             width: 280.0, // Width of the SnackBar.
//             padding: const EdgeInsets.symmetric(
//               horizontal: 8.0, // Inner padding for SnackBar content.
//             ),
//             behavior: SnackBarBehavior.floating,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//           ),
//         );
//         return false;
//       } else if (double.parse(inputValue) < 10) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             action: SnackBarAction(
//               label: 'Error',
//               onPressed: () {
//                 // Code to execute.
//               },
//             ),
//             content: const Text('Amount must be greater than 10.'),
//             duration: const Duration(milliseconds: 1500),
//             width: 280.0, // Width of the SnackBar.
//             padding: const EdgeInsets.symmetric(
//               horizontal: 8.0, // Inner padding for SnackBar content.
//             ),
//             behavior: SnackBarBehavior.floating,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//           ),
//         );

//         return false;
//       } else if (double.parse(inputValue) > 99999) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             action: SnackBarAction(
//               label: 'Error',
//               onPressed: () {
//                 // Code to execute.
//               },
//             ),
//             content: const Text('Amount must be less than 100,000'),
//             duration: const Duration(milliseconds: 1500),
//             width: 280.0, // Width of the SnackBar.
//             padding: const EdgeInsets.symmetric(
//               horizontal: 8.0, // Inner padding for SnackBar content.
//             ),
//             behavior: SnackBarBehavior.floating,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//           ),
//         );
//         return false;
//       }
//       return true;
//     }

//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(children: [
//             Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     const Expanded(
//                       flex: 2,
//                       child: Text(
//                         "Buy \$",
//                         textAlign: TextAlign.right,
//                         style: TextStyle(
//                             fontSize: 48,
//                             fontWeight: FontWeight.w700,
//                             color: Colors.blue),
//                       ),
//                     ),
//                     Expanded(
//                       flex: 3,
//                       child: Padding(
//                         padding: const EdgeInsets.only(bottom: 8),
//                         child: TextField(
//                           controller: textFieldController,
//                           autofocus: true,
//                           keyboardType: TextInputType.number,
//                           maxLength: 6,
//                           showCursor: false,
//                           enableSuggestions: true,
//                           autocorrect: true,
//                           style: const TextStyle(
//                             fontSize: 48,
//                             fontWeight: FontWeight.w700,
//                             color: Colors.black,
//                           ),
//                           textAlignVertical: TextAlignVertical.bottom,
//                           textAlign: TextAlign.left,
//                           expands: false,
//                           decoration: const InputDecoration(
//                             border: UnderlineInputBorder(
//                                 borderSide: BorderSide.none),
//                             counterText: "",
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 const Text(
//                   "in Bitcoin",
//                   style: TextStyle(
//                       fontSize: 48,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.blue),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     FutureBuilder<int>(
//                       future: fetchBitcoinPrice(),
//                       builder: (context, snapshot) {
//                         if (snapshot.hasData) {
//                           return Text(
//                             '1 BTC = \$${btcPriceApiResponse.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
//                             style: const TextStyle(
//                                 height: 1.5,
//                                 fontSize: 18,
//                                 color: Colors.blueGrey),
//                           );
//                         } else if (snapshot.hasError) {
//                           return Text('${snapshot.error}');
//                         }
//                         // By default, show a loading spinner.
//                         return const CircularProgressIndicator();
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 120),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       width: 240,
//                       child: ElevatedButton(
//                           onPressed: () {
//                             if (isValid(textFieldController.text)) {
//                               double fees =
//                                   double.parse(textFieldController.text) / 100;
//                               double total =
//                                   double.parse(textFieldController.text) + fees;
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => PreviewBuyPage(
//                                       bitcoinPurchaseAmount:
//                                           textFieldController.text,
//                                       fees: fees.toStringAsFixed(2),
//                                       total: total.toStringAsFixed(2)),
//                                 ),
//                               );
//                             }
//                             return;
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.orangeAccent,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(6),
//                             ),
//                           ),
//                           child: const Text('Preview Buy')),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }
