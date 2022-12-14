import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget carrosselImagens = SizedBox(
      child: CarouselSlider(
  options: CarouselOptions(height: 200.0, enlargeCenterPage: true, autoPlay: true),
  items: ['images/banner/banner1.jpg', 'images/banner/banner2.jpg', 'images/banner/banner3.jpg'].map((i) {
    return Builder(
      builder: (BuildContext context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Image.asset(i)
          )
        );
      },
    );
  }).toList(),
)
    );
