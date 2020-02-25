import 'package:flutter/material.dart';
import 'package:flutter_messenger/screens/messenger_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Messenger",
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: MessengerHome(),
    );
  }
}