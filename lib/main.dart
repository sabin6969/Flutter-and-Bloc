import 'package:blocpracticeapp/views/internet_connectivity_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter and Bloc",
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: const InternetConnectivityView(),
    );
  }
}
