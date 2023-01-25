// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:poll/Pages/Home.dart';
import 'package:poll/Pages/qr.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          // appBar: AppBar(
          // title: Text("Flutter Radio Button Example"),
          // ),
          body: SafeArea(
              child: Center(
        child: Radiobutton(),
      ))),
    );
  }
}

class Radiobutton extends StatefulWidget {
  @override
  RadioButtonWidget createState() => RadioButtonWidget();
}

class RadioButtonWidget extends State {
  String radioItem = '';

  Widget build(BuildContext context) {
    return QRScan();
  }
}
