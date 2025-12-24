import 'package:flutter/material.dart';
import 'package:flutter_course/training_app/pages/home_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class TrainingAppMain extends StatelessWidget {
  const TrainingAppMain({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}
