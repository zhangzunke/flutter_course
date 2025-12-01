import 'package:flutter/material.dart';
import 'package:flutter_course/pet_app_ui/consts.dart';
import 'package:flutter_course/pet_app_ui/models/cats_model.dart';
import 'package:readmore/readmore.dart';

class PetsDetailScreen extends StatefulWidget {
  final Cat cat;
  const PetsDetailScreen({super.key, required this.cat});

  @override
  State<PetsDetailScreen> createState() => _PetsDetailScreenState();
}

class _PetsDetailScreenState extends State<PetsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            itemsImageAndBackground(size),
            // for back button
            backButton(size, context),
            // for name location and favorite icon
            Positioned(
              bottom: 0,
              child: Container(
                height: size.height * 0.52,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        nameAddressAndFavoriteButton(),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            moreInfo(
                              color1,
                              color1.withAlpha(122),
                              widget.cat.sex,
                              'Sex',
                            ),
                            moreInfo(
                              color2,
                              color2.withAlpha(122),
                              '${widget.cat.age.toString()} Years',
                              'Age',
                            ),
                            moreInfo(
                              color3,
                              color3.withAlpha(122),
                              '${widget.cat.weight.toString()} KG',
                              'Weight',
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        // for owner name
                        ownerInfo(),
                        // for description
                        SizedBox(height: 20),
                        // for this see more and see less you need to add a package
                        ReadMoreText(
                          widget.cat.description,
                          textAlign: TextAlign.justify,
                          trimCollapsedText: 'See More',
                          colorClickableText: Colors.orange,
                          trimLength: 100,
                          trimMode: TrimMode.Length,
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        ),
                        SizedBox(height: 20),
                        // for adopt me button
                        Container(
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: buttonColor,
                          ),
                          child: Center(
                            child: Text(
                              'Adopt Me',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row ownerInfo() {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: widget.cat.color,
          backgroundImage: AssetImage(widget.cat.owner.image),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.cat.owner.name,
                style: TextStyle(
                  fontSize: 18,
                  color: black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${widget.cat.name} Owner',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color3.withAlpha(76),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.chat_outlined, color: Colors.lightBlue, size: 16),
        ),
        SizedBox(width: 10),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.red.withAlpha(51),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.phone_outlined, color: Colors.red, size: 16),
        ),
      ],
    );
  }

  Row nameAddressAndFavoriteButton() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.cat.name,
                style: TextStyle(
                  fontSize: 25,
                  color: black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.location_on_outlined, color: blue),
                  Text(
                    '${widget.cat.location} (${widget.cat.distance} Km)',
                    style: TextStyle(color: black.withAlpha(132), fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
        // for favorite icon
        Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 3),
                color: widget.cat.fav
                    ? Colors.red.withAlpha(25)
                    : black.withAlpha(51),
                blurRadius: 2,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Icon(
            widget.cat.fav
                ? Icons.favorite_rounded
                : Icons.favorite_border_rounded,
            color: widget.cat.fav ? Colors.red : black.withAlpha(51),
          ),
        ),
      ],
    );
  }

  Positioned backButton(Size size, BuildContext context) {
    return Positioned(
      height: size.height * 0.14,
      right: 20,
      left: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_new_rounded, color: black),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Icon(Icons.more_horiz, color: black),
          ),
        ],
      ),
    );
  }

  Container itemsImageAndBackground(Size size) {
    return Container(
      height: size.height * 0.5,
      width: size.width,
      decoration: BoxDecoration(color: widget.cat.color.withAlpha(122)),
      child: Stack(
        children: [
          Positioned(
            left: -60,
            top: 30,
            child: Transform.rotate(
              angle: -11.5,
              child: Image.asset(
                'assets/pets-image/claw.png',
                color: widget.cat.color,
                height: 200,
              ),
            ),
          ),
          Positioned(
            right: -60,
            bottom: 0,
            child: Transform.rotate(
              angle: 12,
              child: Image.asset(
                'assets/pets-image/claw.png',
                color: widget.cat.color,
                height: 200,
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Hero(
              tag: widget.cat.image,
              child: Image.asset(widget.cat.image, height: size.height * 0.45),
            ),
          ),
        ],
      ),
    );
  }

  ClipRRect moreInfo(pawColor, backgroundColor, title, value) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Positioned(
            bottom: -20,
            right: 0,
            child: Transform.rotate(
              angle: 12,
              child: Image.asset(
                'assets/pets-image/claw.png',
                color: pawColor,
                height: 55,
              ),
            ),
          ),
          Container(
            height: 100,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: backgroundColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  value,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
