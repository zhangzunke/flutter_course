import 'package:flutter_course/doctor_appoinment_app/models/review.dart';

class Doctor {
  final int doctorId;
  final String name, specialist, about, location, image;
  final int price;
  final int color;
  final List<Review> reviews;

  Doctor({
    required this.doctorId,
    required this.name,
    required this.specialist,
    required this.about,
    required this.location,
    required this.image,
    required this.color,
    required this.price,
    required this.reviews,
  });
}

List<Doctor> doctors = [
  Doctor(
    doctorId: 1,
    name: "Chris Frazier",
    specialist: "Pediatrician",
    about: about,
    location: "123 Main St, Springfield",
    price: 59,
    image: "assets/doctor-appoinment/doctors/1.webp",
    color: 0xFFffcdcf,
    reviews: [reviews[0], reviews[1], reviews[2], reviews[3], reviews[4]],
  ),
  Doctor(
    doctorId: 2,
    name: "Viola Dunn",
    specialist: "Therapist",
    about: about,
    location: "3516 W. Gray St. Utica, Pennsylvania",
    price: 52,
    image: "assets/doctor-appoinment/doctors/2.webp",
    color: 0xFFf9d8b9,
    reviews: [reviews[5], reviews[6], reviews[7]],
  ),
  Doctor(
    doctorId: 3,
    name: "Liuka Leehane",
    specialist: "Orthopedics",
    about: about,
    location: "357 Spruce Ln, Bostont",
    price: 53,
    image: "assets/doctor-appoinment/doctors/3.webp",
    color: 0xFFccd1fa,
    reviews: [reviews[3], reviews[2], reviews[1]],
  ),
  Doctor(
    doctorId: 4,
    name: "John Smith",
    specialist: "Neurologists",
    about: about,
    location: "68 Stoughton Terrace",
    price: 80,
    image: "assets/doctor-appoinment/doctors/4.webp",
    color: 0xFFe1edf8,
    reviews: [reviews[1], reviews[4], reviews[6], reviews[7]],
  ),
  Doctor(
    doctorId: 5,
    name: "Raj Patel",
    specialist: "Emergency Medicine",
    about: about,
    location: "654 Pine St, Miami",
    price: 80,
    image: "assets/doctor-appoinment/doctors/5.png",
    color: 0xFFe1edf8,
    reviews: [reviews[1], reviews[3], reviews[5]],
  ),
  Doctor(
    doctorId: 6,
    name: "Sarah Lee",
    specialist: "Neurologists",
    about: about,
    location: "789 Oak St, Los Angeles",
    price: 54,
    image: "assets/doctor-appoinment/doctors/6.webp",
    color: 0xFF11583c,
    reviews: [reviews[0], reviews[2], reviews[4], reviews[7]],
  ),
  Doctor(
    doctorId: 7,
    name: "Michael Brown",
    specialist: "Psychiatry",
    about: about,
    location: "246 Cedar Blvd, Denver",
    price: 76,
    image: "assets/doctor-appoinment/doctors/7.webp",
    color: 0xFFf9d8b9,
    reviews: [reviews[5], reviews[3], reviews[4], reviews[2], reviews[7]],
  ),
  Doctor(
    doctorId: 8,
    name: "David Jones",
    specialist: "Cardiologists",
    about: about,
    location: "767 Old Gate Trail",
    price: 57,
    image: "assets/doctor-appoinment/doctors/8.webp",
    color: 0xFFffcdcf,
    reviews: [reviews[3], reviews[5]],
  ),
  Doctor(
    doctorId: 9,
    name: "Robert Davis",
    specialist: "Orthopedics",
    about: about,
    location: "746 Rutledge Center",
    price: 55,
    image: "assets/doctor-appoinment/doctors/9.webp",
    color: 0xFFf9d8b9,
    reviews: [reviews[1], reviews[5], reviews[7], reviews[0]],
  ),
  Doctor(
    doctorId: 10,
    name: "Linda Wilson",
    specialist: "Dermatology",
    about: about,
    location: "283 Northview Park",
    price: 56,
    image: "assets/doctor-appoinment/doctors/10.webp",
    color: 0xFFffcdcf,
    reviews: [reviews[1], reviews[4], reviews[3]],
  ),
];
const about =
    "is an experienced specialist who is constantly working on improving her skills.";

rate(Doctor doctor) {
  double rate = 0;
  for (var review in doctor.reviews) {
    rate += review.rate;
  }
  return rate / doctor.reviews.length;
}
