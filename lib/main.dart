import 'package:flutter/material.dart';
import 'package:mvcapp/View/insurance_view.dart';
import 'package:mvcapp/View/main_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MvcTest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Viewpage(),
    );
  }
}
