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
  List videoInfo = [];
  _initData() {
    DefaultAssetBundle.of(
      context,
    ).loadString('json/training_app/video_info.json').then((value) {
      setState(() {
        videoInfo = jsonDecode(value);
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
                    SizedBox(height: 20),
                    Expanded(child: _listView(screenWidth)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView _listView(double screenWidth) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      itemCount: videoInfo.length,
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: () {},
          child: _buildCard(screenWidth, index),
        );
      },
    );
  }

  SizedBox _buildCard(double screenWidth, int index) {
    final bottedLength = ((screenWidth - 60 - 80) / 3).toInt();
    return SizedBox(
      width: screenWidth,
      height: 135,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(videoInfo[index]['thumbnail']),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoInfo[index]['title'],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    videoInfo[index]['time'],
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 18),
          Row(
            children: [
              Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0xFFeaeefc),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '15s rest',
                    style: TextStyle(color: Color(0xFF839fed)),
                  ),
                ),
              ),
              Row(
                children: [
                  for (int i = 0; i < bottedLength; i++)
                    i.isEven
                        ? Container(
                            width: 3,
                            height: 1,
                            decoration: BoxDecoration(
                              color: Color(0xFF839fed),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          )
                        : Container(width: 3, height: 1, color: Colors.white),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
