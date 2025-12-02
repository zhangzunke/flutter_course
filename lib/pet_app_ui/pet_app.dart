import 'package:flutter/material.dart';
import 'package:flutter_course/pet_app_ui/pets_onboarding_screen.dart';

class PetApp extends StatelessWidget {
  const PetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Pet App', home: PetsOnboardingScreen());
  }
}
