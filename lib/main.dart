import 'package:flutter/material.dart';
import 'screens/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BJ WASIDI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), 
    );
  }
}
