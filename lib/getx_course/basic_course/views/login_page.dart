import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: ListTile(
        title: Text('Go to Home'),
        onTap: () {
          Get.offAllNamed("/home");
        },
      ),
    );
  }
}
