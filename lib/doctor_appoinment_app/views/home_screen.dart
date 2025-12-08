import 'package:flutter/material.dart';
import 'package:flutter_course/doctor_appoinment_app/consts.dart';
import 'package:flutter_course/doctor_appoinment_app/models/doctor.dart';
import 'package:flutter_course/doctor_appoinment_app/models/symptom.dart';
import 'package:flutter_course/doctor_appoinment_app/views/doctor_detail_screen.dart';
import 'package:flutter_course/doctor_appoinment_app/widgets/doctor_list_item.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          SizedBox(height: 20),
          clinicHome(),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'What are your symptoms?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: -.5,
                color: black,
              ),
            ),
          ),
          SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: [
                ...List.generate(
                  symptoms.length,
                  (index) => Padding(
                    padding: index == 0
                        ? EdgeInsets.only(left: 15, right: 15)
                        : EdgeInsets.only(right: 15),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        color: grey.withAlpha(25),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundImage: AssetImage(symptoms[index].image),
                          ),
                          SizedBox(width: 10),
                          Text(
                            symptoms[index].label,
                            style: TextStyle(fontSize: 16, color: black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 35),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Popular doctors',
              style: TextStyle(
                fontSize: 22,
                color: black,
                letterSpacing: -.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          reviewList(context),
        ],
      ),
    );
  }

  Expanded reviewList(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(15),
        child: Wrap(
          runSpacing: 14,
          spacing: 16,
          children: [
            ...List.generate(
              doctors.length,
              (index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          DoctorDetailScreen(doctor: doctors[index]),
                    ),
                  );
                },
                child: DoctorListItem(doctor: doctors[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding clinicHome() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: purple.withAlpha(51),
                    blurRadius: 15,
                    spreadRadius: 5,
                    offset: Offset(-0, 10),
                  ),
                ],
                color: purple,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.add_circle, size: 60, color: Colors.white),
                  SizedBox(height: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Clinic visit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          //letterSpacing: -1,
                        ),
                      ),
                      Text(
                        'Make an appoinment',
                        style: TextStyle(
                          color: Colors.white38,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: grey.withAlpha(51),
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: Offset(-0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: purple.withAlpha(38),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.home_filled, size: 30, color: purple),
                  ),
                  SizedBox(height: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Home visit',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -1,
                        ),
                      ),
                      Text(
                        'Call the doctor home',
                        style: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding header() {
    return Padding(
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
            backgroundImage: AssetImage('assets/doctor-appoinment/doctor.jpg'),
          ),
        ],
      ),
    );
  }
}
