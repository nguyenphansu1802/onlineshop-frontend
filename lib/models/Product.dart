import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Banana",
      price: 23,
      size: 120,
      description: dummyText,
      image: "assets/images/banana.png",
      color: Color.fromARGB(255, 17, 182, 132)),
  Product(
      id: 2,
      title: "Apple",
      price: 45,
      size: 8,
      description: dummyText,
      image: "assets/images/apple.png",
      color: Color.fromARGB(255, 228, 148, 78)),
  Product(
      id: 3,
      title: "Grape",
      price: 84,
      size: 10,
      description: dummyText,
      image: "assets/images/grape.png",
      color: Color.fromARGB(255, 185, 139, 127)),
  Product(
      id: 4,
      title: "Plum",
      price: 12,
      size: 11,
      description: dummyText,
      image: "assets/images/plum.png",
      color: Color.fromARGB(255, 143, 117, 184)),
  Product(
      id: 5,
      title: "Water Melon",
      price: 20,
      size: 12,
      description: dummyText,
      image: "assets/images/watermelon.png",
      color: Color(0xFFFB7883)),
  Product(
    id: 6,
    title: "Dragon Fruit",
    price: 15,
    size: 12,
    description: dummyText,
    image: "assets/images/dragonfruit.png",
    color: Color.fromARGB(255, 165, 139, 139),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
