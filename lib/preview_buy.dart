import "package:flutter/material.dart";

class PreviewBuyPage extends StatefulWidget {
  const PreviewBuyPage({super.key});

  @override
  State<PreviewBuyPage> createState() => _PreviewBuyPageState();
}

class _PreviewBuyPageState extends State<PreviewBuyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(children: [
        Text("Preview Buy"),
        Text("Preview Buy"),
      ],)
    );
  }
}