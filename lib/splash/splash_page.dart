import 'package:flutter/material.dart';
import 'package:formation_intermediaire/login/login_page.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 1),
      () => Get.to(() =>  LoginPage()),
    );

    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage("assets/logo/orange.png")),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
