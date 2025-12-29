import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_course/training_app/pages/video_info.dart';
import 'package:flutter_course/training_app/utils/app_colors.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];
  _initData() {
    DefaultAssetBundle.of(
      context,
    ).loadString('json/training_app/info.json').then((value) {
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
      backgroundColor: AppColors.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Training",
                  style: TextStyle(
                    fontSize: 30,
                    color: AppColors.homePageTitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: AppColors.homePageIcons,
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: AppColors.homePageIcons,
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: AppColors.homePageIcons,
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Text(
                  "Your program",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.homePageSubtitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                Text(
                  "Details",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.homePageDetail,
                  ),
                ),
                SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    Get.to(() => VideoInfo());
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: AppColors.homePageIcons,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: screenWidth,
              height: 220,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.gradientFirst.withAlpha(204),
                    AppColors.gradientSecond.withAlpha(230),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(80),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.gradientSecond.withAlpha(100),
                    blurRadius: 20,
                    offset: Offset(5, 10),
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Next workout",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.homePageContainerTextSmall,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Legs Toning",
                      style: TextStyle(
                        fontSize: 25,
                        color: AppColors.homePageContainerTextSmall,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "and Glutes Workout",
                      style: TextStyle(
                        fontSize: 25,
                        color: AppColors.homePageContainerTextSmall,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              size: 20,
                              color: AppColors.homePageContainerTextSmall,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "60 min",
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.homePageContainerTextSmall,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.gradientFirst,
                                blurRadius: 10,
                                offset: Offset(4, 8),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.play_circle_fill,
                            size: 60,
                            color: AppColors.homePageContainerTextSmall,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            SizedBox(
              width: screenWidth,
              height: 180,
              child: Stack(
                children: [
                  Container(
                    width: screenWidth,
                    height: 120,
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage('assets/training_app/card.jpg'),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 40,
                          offset: Offset(8, 10),
                          color: AppColors.gradientSecond.withAlpha(76),
                        ),
                        BoxShadow(
                          blurRadius: 10,
                          offset: Offset(-1, -5),
                          color: AppColors.gradientSecond.withAlpha(76),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    width: screenWidth,
                    margin: EdgeInsets.only(right: 200, bottom: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage('assets/training_app/figure.png'),
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth,
                    height: 100,
                    margin: EdgeInsets.only(left: 150, top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'You are doing great',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.homePageDetail,
                          ),
                        ),
                        SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            text: 'Keep it up\n',
                            style: TextStyle(
                              color: AppColors.homePagePlanColor,
                              fontSize: 16,
                            ),
                            children: [TextSpan(text: 'stick to your plan')],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  'Area of foucs',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: AppColors.homePageTitle,
                  ),
                ),
              ],
            ),
            Expanded(
              child: OverflowBox(
                maxWidth: screenWidth,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    itemCount: (info.length / 2).toInt(),
                    itemBuilder: (context, index) {
                      final leftIndex = index * 2;
                      final rightIndex = leftIndex + 1;
                      return Row(
                        children: [
                          Container(
                            height: 170,
                            width: (screenWidth - 90) / 2,
                            margin: EdgeInsets.only(
                              left: 30,
                              bottom: 15,
                              top: 15,
                            ),
                            padding: EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(info[leftIndex]['img']),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(5, 5),
                                  color: AppColors.gradientSecond.withAlpha(25),
                                ),
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(-5, -5),
                                  color: AppColors.gradientSecond.withAlpha(25),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[leftIndex]['title'],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.homePageDetail,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 170,
                            width: (screenWidth - 90) / 2,
                            margin: EdgeInsets.only(
                              left: 30,
                              bottom: 15,
                              top: 15,
                            ),
                            padding: EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(info[rightIndex]['img']),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(5, 5),
                                  color: AppColors.gradientSecond.withAlpha(25),
                                ),
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(-5, -5),
                                  color: AppColors.gradientSecond.withAlpha(25),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[rightIndex]['title'],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.homePageDetail,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
