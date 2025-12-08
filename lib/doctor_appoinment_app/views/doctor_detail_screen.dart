import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/doctor_appoinment_app/consts.dart';
import 'package:flutter_course/doctor_appoinment_app/models/doctor.dart';
import 'package:flutter_course/doctor_appoinment_app/widgets/review_list_item.dart';

class DoctorDetailScreen extends StatelessWidget {
  final Doctor doctor;
  const DoctorDetailScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purple,
      //extendBody: true,
      body: SafeArea(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                      Icon(Icons.more_vert, color: Colors.white),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Color(doctor.color),
                  backgroundImage: AssetImage(doctor.image),
                ),
                SizedBox(height: 18),
                Text(
                  'Dr. ${doctor.name}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
                Text(
                  doctor.specialist,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white54,
                    letterSpacing: 0,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white.withAlpha(76),
                      radius: 30,
                      child: Icon(
                        CupertinoIcons.phone_fill,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 30),
                    CircleAvatar(
                      backgroundColor: Colors.white.withAlpha(76),
                      radius: 30,
                      child: Icon(
                        CupertinoIcons.chat_bubble_text_fill,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About Doctor',
                            style: TextStyle(
                              fontSize: 18,
                              color: black,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Dr. ${doctor.name} ${doctor.about}',
                            textAlign: TextAlign.justify,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 16,
                              color: black,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Reviews',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: black,
                                  letterSpacing: 0,
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(Icons.star, color: Colors.amber[800]),
                              SizedBox(width: 5),
                              Text(
                                rate(doctor).toStringAsFixed(1),
                                style: TextStyle(
                                  color: black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                '(${doctor.reviews.length})',
                                style: TextStyle(color: grey, letterSpacing: 0),
                              ),
                            ],
                          ),
                          Text(
                            'See all',
                            style: TextStyle(
                              color: purple,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    reviewList(),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Location',
                            style: TextStyle(
                              fontSize: 18,
                              color: black,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -.5,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: purple.withAlpha(76),
                                ),
                                child: Icon(Icons.location_on, color: purple),
                              ),
                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Lotus Medical Center',
                                    style: TextStyle(
                                      fontSize: 18,
                                      letterSpacing: -.5,
                                      color: black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    doctor.location,
                                    style: TextStyle(color: grey),
                                  ),
                                ],
                              ),
                            ],
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
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: grey.withAlpha(76), blurRadius: 5)],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Consultation Price',
                  style: TextStyle(letterSpacing: 0, color: grey),
                ),
                Text(
                  '\$${doctor.price}',
                  style: TextStyle(
                    fontSize: 20,
                    color: black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: purple,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'Book Appoinment',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView reviewList() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 10),
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            doctor.reviews.length,
            (index) => Padding(
              padding: index == 0
                  ? EdgeInsets.only(left: 15, right: 15)
                  : EdgeInsets.only(right: 15),
              child: ReviewListItem(review: doctor.reviews[index]),
            ),
          ),
        ],
      ),
    );
  }
}
