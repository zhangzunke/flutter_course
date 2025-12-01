import 'package:flutter/material.dart';
import 'package:flutter_course/pet_app_ui/pets_onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Pet App', home: PetsOnboardingScreen());
  }
}
