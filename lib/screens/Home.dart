import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/Header.dart';
import '../components/Menu.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(context),
      drawer: Menu(context),
      body:
        Center(
          child: Text("Essa minha HOME"),
        )
    );
  }
}

