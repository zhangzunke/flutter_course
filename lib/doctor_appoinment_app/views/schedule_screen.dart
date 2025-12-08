import 'package:flutter/material.dart';
import 'package:flutter_course/doctor_appoinment_app/consts.dart';
import 'package:flutter_course/doctor_appoinment_app/models/schedule.dart';
import 'package:flutter_course/doctor_appoinment_app/widgets/schedule_item.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Schedule',
              style: TextStyle(
                fontSize: 28,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        color: grey.withAlpha(25),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TabBar(
                        indicatorColor: purple,
                        unselectedLabelColor: black.withAlpha(127),
                        labelStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        labelColor: Colors.white,
                        indicator: BoxDecoration(
                          color: purple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        tabs: [
                          ...List.generate(
                            tabs.length,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 13),
                              child: Tab(text: tabs[index]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: TabBarView(
                      children: [
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nearest visit',
                                style: TextStyle(
                                  color: black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -0.4,
                                ),
                              ),
                              SizedBox(height: 20),
                              ...List.generate(
                                nearest.length,
                                (index) => Padding(
                                  padding: EdgeInsets.only(bottom: 15),
                                  child: ScheduleItem(schedule: nearest[index]),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Future visit',
                                style: TextStyle(
                                  color: black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -0.4,
                                ),
                              ),
                              SizedBox(height: 20),
                              ...List.generate(
                                futures.length,
                                (index) => Padding(
                                  padding: EdgeInsets.only(bottom: 15),
                                  child: ScheduleItem(schedule: futures[index]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Text(
                            'Complted',
                            style: TextStyle(fontSize: 24, color: purple),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Cancelled',
                            style: TextStyle(fontSize: 24, color: purple),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
