import 'package:flutter/material.dart';
import 'package:flutter_course/doctor_appoinment_app/consts.dart';
import 'package:flutter_course/doctor_appoinment_app/models/schedule.dart';
import 'package:intl/intl.dart';

class ScheduleItem extends StatelessWidget {
  final Schedule schedule;
  const ScheduleItem({super.key, required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: Offset.zero,
            color: grey.withAlpha(51),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr. ${schedule.doctor.name}',
                    style: TextStyle(
                      color: black,
                      fontSize: 18,
                      letterSpacing: -0.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    schedule.doctor.specialist,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(schedule.doctor.image),
                  ),
                  shape: BoxShape.circle,
                  color: Color(schedule.doctor.color).withAlpha(127),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(color: Colors.black12),
          SizedBox(height: 10),
          Row(
            children: [
              Row(
                children: [
                  Icon(Icons.calendar_month, color: grey),
                  SizedBox(width: 5),
                  Text(
                    DateFormat('d/MM/y').format(schedule.time),
                    style: TextStyle(color: black, letterSpacing: -.5),
                  ),
                ],
              ),
              SizedBox(width: 15),
              Row(
                children: [
                  Icon(Icons.access_time, color: grey),
                  SizedBox(width: 5),
                  Text(
                    DateFormat('jm').format(schedule.time),
                    style: TextStyle(color: black, letterSpacing: 0),
                  ),
                ],
              ),
              SizedBox(width: 25),
              Row(
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    schedule.status,
                    style: TextStyle(color: black, letterSpacing: 0),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 2.5,
                decoration: BoxDecoration(
                  color: grey.withAlpha(25),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 2.25,
                decoration: BoxDecoration(
                  color: purple,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Reschedule',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
