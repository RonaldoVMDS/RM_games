// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

Widget carrosselImagens = SizedBox(
      height: 145.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        // ignore: prefer_const_literals_to_create_immutables
        images: [
          const AssetImage('images/banner/banner1.jpg'),
          const AssetImage('images/banner/banner2.jpg'),
        ], 
        dotSize: 3,
        showIndicator: false,
        indicatorBgPadding: 3.5,
        dotIncreaseSize: 3,
        autoplay: true,
        animationDuration: const Duration(milliseconds: 1300),
      ),
    );