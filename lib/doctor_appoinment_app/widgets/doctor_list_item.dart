import 'package:flutter/material.dart';
import 'package:flutter_course/doctor_appoinment_app/consts.dart';
import 'package:flutter_course/doctor_appoinment_app/models/doctor.dart';

class DoctorListItem extends StatelessWidget {
  final Doctor doctor;
  const DoctorListItem({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      width: MediaQuery.of(context).size.width / 2.24,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: grey.withAlpha(51), blurRadius: 10)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 45,
            backgroundColor: Color(doctor.color),
            backgroundImage: AssetImage(doctor.image),
          ),
          SizedBox(height: 20),
          Text(
            "Dr. ${doctor.name}",
            style: TextStyle(
              fontSize: 18,
              letterSpacing: -.5,
              color: black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            doctor.specialist,
            style: TextStyle(
              letterSpacing: 0,
              color: Colors.black26,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.orange[50],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, color: Colors.orange),
                SizedBox(width: 5),
                Text(rate(doctor).toStringAsFixed(1)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
