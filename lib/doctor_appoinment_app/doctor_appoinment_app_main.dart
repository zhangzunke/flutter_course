import 'package:flutter/material.dart';
import 'package:flutter_course/doctor_appoinment_app/views/main_page.dart';

class DoctorAppoinmentAppMain extends StatelessWidget {
  const DoctorAppoinmentAppMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Doctor Appoinment App', home: MainPage());
  }
}
