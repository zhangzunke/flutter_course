class Review {
  final int id;
  final String fullname, image, comment;
  final String date;
  final double rate;
  final int color;
  Review({
    required this.id,
    required this.rate,
    required this.fullname,
    required this.image,
    required this.comment,
    required this.date,
    required this.color,
  });
}

List<Review> reviews = [
  Review(
    id: 1,
    fullname: "Joana Perkins",
    image: "assets/doctor-appoinment/reviews/1.avif",
    rate: 4.6,
    comment:
        "Many thanks to my doctor! She is professional, expert and competent doctor...",
    date: "10/22/2022",
    color: 0xFFffcdcf,
  ),
  Review(
    id: 2,
    fullname: "Paolina Caldicot",
    image: "assets/doctor-appoinment/reviews/2.jpg",
    rate: 3.8,
    comment: "Greatfull to find such a great and kind doctor",
    date: "3/16/2022",
    color: 0xFFccd1fa,
  ),
  Review(
    id: 3,
    fullname: "Leicester Norcliffe",
    image: "assets/doctor-appoinment/reviews/3.webp",
    rate: 4.5,
    comment:
        "The doctor was incredibly attentive and really took the time to listen to my concerns. I felt like my health and well-being truly mattered. Highly recommend!",
    date: "12/10/2022",
    color: 0xFFf9d8b9,
  ),
  Review(
    id: 4,
    fullname: "Nikolaos Cooksley",
    image: "assets/doctor-appoinment/reviews/4.jpg",
    rate: 3.5,
    comment:
        "I was nervous before my appointment, but the doctor’s calm and reassuring manner put me right at ease. I left with a clear understanding of my treatment plan.",
    date: "4/19/2022",
    color: 0xFFccae4d,
  ),
  Review(
    id: 5,
    fullname: "Andy Beretta",
    image: "assets/doctor-appoinment/reviews/5.avif",
    rate: 3.3,
    comment:
        "Amazing experience! The doctor was thorough and answered all my questions without rushing. I feel much more confident about my health.",
    date: "10/27/2022",
    color: 0xFF086887,
  ),
  Review(
    id: 6,
    fullname: "Mada Prodrick",
    image: "assets/doctor-appoinment/reviews/6.avif",
    rate: 3.9,
    comment:
        "The level of care I received was outstanding! I appreciated how the doctor explained everything in detail, making sure I understood my options.",
    date: "10/11/2022",
    color: 0xFFe1edf8,
  ),
  Review(
    id: 7,
    fullname: "Constantin Slowan",
    image: "assets/doctor-appoinment/reviews/7.jpg",
    rate: 3.2,
    comment:
        "From start to finish, my visit was excellent. The doctor was knowledgeable, compassionate, and made me feel valued. I’ll definitely be back!",
    date: "10/24/2022",
    color: 0xFFe8ee07,
  ),
  Review(
    id: 8,
    fullname: "Sally Fernyhough",
    image: "assets/doctor-appoinment/reviews/8.jpg",
    rate: 3.7,
    comment:
        "The doctor was very professional and empathetic. I felt heard and understood, and the treatment has already made a difference.",
    date: "5/11/2022",
    color: 0xFFe1edf8,
  ),
];
