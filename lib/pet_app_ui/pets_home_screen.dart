import 'package:flutter/material.dart';
import 'package:flutter_course/pet_app_ui/consts.dart';
import 'package:flutter_course/pet_app_ui/models/cats_model.dart';
import 'package:flutter_course/pet_app_ui/pets_detail_screen.dart';

class PetsHomeScreen extends StatefulWidget {
  const PetsHomeScreen({super.key});

  @override
  State<PetsHomeScreen> createState() => _PetsHomeScreenState();
}

class _PetsHomeScreenState extends State<PetsHomeScreen> {
  int _selectedCategory = 0;
  int _selectedIndex = 0;
  List<IconData> icons = [
    Icons.home_outlined,
    Icons.favorite_outline_rounded,
    Icons.chat,
    Icons.person_outline_rounded,
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            headerParts(),
            SizedBox(height: 20),
            joinNow(),
            SizedBox(height: 30),
            categoryViewAll(name: 'Categories'),
            const SizedBox(height: 25),
            categoryItems(),
            const SizedBox(height: 20),
            categoryViewAll(name: 'Adopt Pet'),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(cats.length, (int index) {
                  Cat cat = cats[index];
                  return petItems(size, cat);
                }),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(icons.length, (int index) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                height: 60,
                width: 50,
                padding: EdgeInsets.all(5),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      children: [
                        Icon(
                          icons[index],
                          size: 30,
                          color: _selectedIndex == index
                              ? blue
                              : black.withAlpha(123),
                        ),
                        SizedBox(height: 5),
                        _selectedIndex == index
                            ? Container(
                                height: 5,
                                width: 5,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: blue,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    index == 2
                        ? Positioned(
                            right: 0,
                            top: -10,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: buttonColor,
                              ),
                              child: Text(
                                '4',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Padding petItems(Size size, Cat cat) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => PetsDetailScreen(cat: cat)),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(30),
          child: Container(
            height: size.height * 0.3,
            width: size.width * 0.55,
            color: cat.color.withAlpha(122),
            child: Stack(
              children: [
                Positioned(
                  bottom: -10,
                  right: -10,
                  height: 100,
                  width: 100,
                  child: Transform.rotate(
                    angle: 12,
                    child: Image.asset(
                      'assets/pets-image/claw.png',
                      color: cat.color,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: -25,
                  height: 90,
                  width: 90,
                  child: Transform.rotate(
                    angle: -11.5,
                    child: Image.asset(
                      'assets/pets-image/claw.png',
                      color: cat.color,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -10,
                  right: 10,
                  child: Hero(
                    tag: cat.image,
                    child: Image.asset(cat.image, height: size.height * 0.23),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cat.name,
                              style: TextStyle(
                                fontSize: 20,
                                color: black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: blue,
                                  size: 18,
                                ),
                                Text(
                                  '${cat.distance} km',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          cat.fav
                              ? Icons.favorite_rounded
                              : Icons.favorite_outline_rounded,
                          color: cat.fav ? Colors.red : black.withAlpha(123),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView categoryItems() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black12.withAlpha(7),
            ),
            child: Icon(Icons.tune_rounded),
          ),
          ...List.generate(categories.length, (int index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedCategory = index;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: _selectedCategory == index
                        ? buttonColor
                        : Colors.black12.withAlpha(7),
                  ),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      fontSize: 16,
                      color: _selectedCategory == index ? Colors.white : black,
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Padding categoryViewAll({required String name}) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: black,
            ),
          ),
          Spacer(),
          Row(
            children: [
              Text(
                'View All',
                style: TextStyle(fontSize: 12, color: Colors.amber),
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsetsDirectional.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.amber,
                ),
                child: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  size: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding headerParts() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Location',
                style: TextStyle(fontSize: 16, color: black.withAlpha(153)),
              ),
              const SizedBox(width: 5),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: blue,
                size: 18,
              ),
            ],
          ),
          Row(
            children: [
              Text.rich(
                TextSpan(
                  text: 'Chicago, ',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: black,
                  ),
                  children: [
                    TextSpan(
                      text: 'US',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black12.withAlpha(7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.search),
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black12.withAlpha(7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    Icon(Icons.notifications_none_outlined),
                    Positioned(
                      right: 5,
                      top: 5,
                      child: Container(
                        height: 7,
                        width: 7,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding joinNow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 180,
          width: double.infinity,
          color: blueBackground,
          child: Stack(
            children: [
              Positioned(
                bottom: -20,
                right: -30,
                width: 100,
                height: 100,
                child: Transform.rotate(
                  angle: 12,
                  child: Image.asset(
                    'assets/pets-image/claw.png',
                    color: pawColor2,
                  ),
                ),
              ),
              Positioned(
                bottom: -35,
                left: -15,
                width: 100,
                height: 100,
                child: Transform.rotate(
                  angle: -12,
                  child: Image.asset(
                    'assets/pets-image/claw.png',
                    color: pawColor2,
                  ),
                ),
              ),
              Positioned(
                top: -40,
                left: 120,
                width: 110,
                height: 110,
                child: Transform.rotate(
                  angle: -16,
                  child: Image.asset(
                    'assets/pets-image/claw.png',
                    color: pawColor2,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 20,
                height: 170,
                child: Image.asset('assets/pets-image/cat1.png'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Join Our Animal\nLovers Community',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Join Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
