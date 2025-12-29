import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_course/training_app/utils/app_colors.dart';
import 'package:get/get.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({super.key});

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List info = [];
  _initData() {
    DefaultAssetBundle.of(
      context,
    ).loadString('json/training_app/video_info.json').then((value) {
      setState(() {
        info = jsonDecode(value);
      });
    });
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.gradientFirst.withAlpha(229),
              AppColors.gradientSecond,
            ],
            begin: FractionalOffset(0.0, 0.4),
            end: Alignment.topRight,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 70, left: 30, right: 30),
              width: screenWidth,
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: AppColors.secondPageIconColor,
                        ),
                      ),
                      Icon(
                        Icons.info_outline,
                        size: 20,
                        color: AppColors.secondPageIconColor,
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Legs Toning",
                    style: TextStyle(
                      fontSize: 25,
                      color: AppColors.secondPageTitleColor,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "and Glutes Workout",
                    style: TextStyle(
                      fontSize: 25,
                      color: AppColors.secondPageTitleColor,
                    ),
                  ),
                  SizedBox(height: 50),
                  Row(
                    children: [
                      Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              AppColors.secondPageContainerGradient1stColor,
                              AppColors.secondPageContainerGradient2ndColor,
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.timer,
                              color: AppColors.secondPageIconColor,
                              size: 20,
                            ),
                            SizedBox(width: 5),
                            Text(
                              '68 min',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.secondPageTitleColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        height: 30,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              AppColors.secondPageContainerGradient1stColor,
                              AppColors.secondPageContainerGradient2ndColor,
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.handyman_outlined,
                              size: 20,
                              color: AppColors.secondPageIconColor,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Resistent band, kettebell',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.secondPageTitleColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Row(
                      children: [
                        SizedBox(width: 30),
                        Text(
                          'Circuit 1 : Legs Toning',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.circuitsColor,
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Icon(
                              Icons.loop,
                              size: 30,
                              color: AppColors.loopColor,
                            ),
                            SizedBox(width: 10),
                            Text(
                              '3 sets',
                              style: TextStyle(
                                fontSize: 15,
                                color: AppColors.setsColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
