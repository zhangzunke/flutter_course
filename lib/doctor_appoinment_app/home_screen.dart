import 'package:flutter/material.dart';
import 'package:flutter_course/doctor_appoinment_app/consts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Elsie Adkins',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: black,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      'assets/doctor-appoinment/hand.png',
                      height: 40,
                      width: 40,
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(
                    'assets/doctor-appoinment/doctor.jpg',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
