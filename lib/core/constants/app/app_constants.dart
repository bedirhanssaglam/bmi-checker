import 'package:flutter/material.dart';

class AppConstants {
  static AppConstants? _instance;
  static AppConstants get instance {
    _instance ??= AppConstants._init();
    return _instance!;
  }

  AppConstants._init();

  Color silver = const Color(0xFFC6C6C6);
  Color emperor = const Color(0xFF515151);
  Color wildSand = const Color(0xFFF6F6F6);
  Color spectra = const Color(0xFF2D5354);
  Color mineShaft = const Color(0xFF252525);
  Color carnation = const Color(0xFFFB5E5D);
}
