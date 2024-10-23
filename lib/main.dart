import 'package:coba/EventPage.dart';
import 'package:coba/HomePage.dart';
import 'package:coba/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.`
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keraton Surakarta',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
