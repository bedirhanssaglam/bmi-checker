import 'package:bmi_check/core/constants/app/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_theme.dart';
import 'i_text_theme.dart';

class AppThemeLight extends AppTheme with ITheme {
  static AppThemeLight? _instance;

  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData(
        fontFamily: GoogleFonts.inter().fontFamily,
        textTheme: GoogleFonts.interTextTheme().copyWith(
          headline1: textThemeLight!.headline1,
          headline2: textThemeLight!.headline2,
          headline3: textThemeLight!.headline3,
          headline4: textThemeLight!.headline4,
          headline5: textThemeLight!.headline5,
          bodyText1: textThemeLight!.bodyText1,
          bodyText2: textThemeLight!.bodyText2,
          subtitle1: textThemeLight!.subtitle1,
          subtitle2: textThemeLight!.subtitle2,
          button: textThemeLight!.button,
        ),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
            centerTitle: true,
            titleTextStyle: TextStyle(color: AppConstants.instance.wildSand),
            color: Colors.white,
            elevation: 0,
            iconTheme:
                IconThemeData(color: AppConstants.instance.wildSand, size: 21),
            systemOverlayStyle: SystemUiOverlayStyle.dark),
        inputDecorationTheme: InputDecorationTheme(
            focusColor: AppConstants.instance.wildSand,
            labelStyle: const TextStyle(),
            contentPadding: EdgeInsets.zero,
            filled: true,
            enabledBorder:
                const OutlineInputBorder(borderSide: BorderSide(width: 0.3)),
            focusedBorder: const OutlineInputBorder()),
        scaffoldBackgroundColor: Colors.white,
        floatingActionButtonTheme:
            ThemeData.light().floatingActionButtonTheme.copyWith(),
        buttonTheme: ThemeData.light().buttonTheme.copyWith(
              colorScheme: ColorScheme.light(
                onError: AppConstants.instance.carnation,
              ),
            ),
        backgroundColor: Colors.white,
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
      );
}
