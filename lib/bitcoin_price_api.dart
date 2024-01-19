import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response =
      await http.get(Uri.parse('https://mempool.space/api/v1/prices'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load bitcoin price');
  }
}

class Album {
  final int time;
  final int uSD;
  final int eUR;
  final int gBP;
  final int cAD;
  final int cHF;
  final int aUD;
  final int jPY;

  const Album({
    required this.time,
    required this.uSD,
    required this.eUR,
    required this.gBP,
    required this.cAD,
    required this.cHF,
    required this.aUD,
    required this.jPY,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'time': int time,
        'USD': int uSD,
        'EUR': int eUR,
        'GBP': int gBP,
        'CAD': int cAD,
        'CHF': int cHF,
        'AUD': int aUD,
        'JPY': int jPY,
      } =>
        Album(
          time: time,
          uSD: uSD,
          eUR: eUR,
          gBP: gBP,
          cAD: cAD,
          cHF: cHF,
          aUD: aUD,
          jPY: jPY,
        ),
      _ => throw const FormatException('Failed to load bitcoin price.'),
    };
  }
}