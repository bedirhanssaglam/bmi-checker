import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app/app_constants.dart';

class TextThemeLight {
  static TextThemeLight? _instance;
  static TextThemeLight? get instance {
    _instance ??= TextThemeLight._init();
    return _instance;
  }

  TextThemeLight._init();

  final TextStyle headline1 = GoogleFonts.inter(
    fontSize: 12.sp,
    color: AppConstants.instance.mineShaft,
    fontWeight: FontWeight.w500,
  );

  final TextStyle headline2 = GoogleFonts.inter(
    fontSize: 14.sp,
    color: AppConstants.instance.mineShaft,
    fontWeight: FontWeight.w600,
  );

  final TextStyle headline3 = GoogleFonts.inter(
      fontSize: 16.sp, color: AppConstants.instance.mineShaft);

  final TextStyle headline4 = GoogleFonts.inter(
      fontSize: 19.sp, color: AppConstants.instance.mineShaft);

  final TextStyle headline5 = GoogleFonts.inter(
      fontSize: 22.sp, color: AppConstants.instance.mineShaft);

  final TextStyle subtitle1 = GoogleFonts.inter(
      fontSize: 18.sp, color: AppConstants.instance.mineShaft);

  final TextStyle subtitle2 =
      GoogleFonts.inter(fontSize: 12.sp, color: AppConstants.instance.emperor);

  final TextStyle bodyText1 = GoogleFonts.inter(
    fontSize: 9.sp,
    fontWeight: FontWeight.w500,
  );

  final TextStyle bodyText2 = GoogleFonts.inter(
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
    color: AppConstants.instance.mineShaft,
  );

  final TextStyle button =
      GoogleFonts.inter(fontSize: 18.sp, color: Colors.white);
}
