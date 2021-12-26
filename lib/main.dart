import 'package:flutter/material.dart';
import 'package:food_city/dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Food City',
        debugShowCheckedModeBanner: false,
        home: DashboardPage());
  }
}
