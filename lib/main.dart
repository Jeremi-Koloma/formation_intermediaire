import 'package:flutter/material.dart';
import 'package:formation_intermediaire/login/login_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          brightness: Brightness.dark,
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: "Formation Intermediaire",
      home: LoginPage(),
    );
  }
}
