  import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:news_app/styles/colors.dart';
import 'article_layout/main_screen.dart';

Widget EasySplash (){
    return EasySplashScreen(

      logo: Image(image: AssetImage('assets/images/ss.jpg'),
      fit: BoxFit.fill),
      title: Text(
        "News App",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
      ),
      backgroundColor: defaultColor,
      showLoader: false,
      navigator: MainScreen(),
      durationInSeconds: 5,
    );
  }
