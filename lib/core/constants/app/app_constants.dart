import 'package:bmi_check/core/constants/enums/image_enums.dart';
import 'package:flutter/material.dart';

class AppConstants {
  static AppConstants? _instance;
  static AppConstants get instance {
    _instance ??= AppConstants._init();
    return _instance!;
  }

  AppConstants._init();

  String appName = "My BMI Checker";

  List<Map<String, String>> splashData = [
    {
      "text":
          "Health has a special importance in maintaining human life, improving and protecting the quality of life.It should not be forgotten that the protection and development of health is possible primarily by the person taking care of his own health and developing health awareness.",
      "image": ImageEnums.firstIntro.imageName,
    },
    {
      "text":
          "With this application you will use, you will be able to calculate your body mass index, read blog posts and access the sample diet program. After the reminder text, let's get started!",
      "image": ImageEnums.secondIntro.imageName,
    },
    {
      "text":
          "The data are calculated according to the figures published by the World Health Organization. This calculation is for information purposes. Consult your physician for medical diagnosis and treatment.",
      "image": ImageEnums.thirdIntro.imageName,
    },
  ];

  Color silver = const Color(0xFFC6C6C6);
  Color emperor = const Color(0xFF515151);
  Color wildSand = const Color(0xFFF6F6F6);
  Color spectra = const Color(0xFF2D5354);
  Color mineShaft = const Color(0xFF252525);
  Color carnation = const Color(0xFFFB5E5D);
}
