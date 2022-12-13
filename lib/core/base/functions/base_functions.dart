import 'dart:core';
import 'dart:io';
import 'dart:developer' as developer;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../components/text/custom_text.dart';

Widget platformIndicator() {
  return Center(
    child: Platform.isIOS
        ? const CupertinoActivityIndicator()
        : const CircularProgressIndicator(),
  );
}

IconButton platformBackButton({
  required VoidCallback onPressed,
  Color? color = Colors.black,
}) {
  return Platform.isIOS
      ? IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.arrow_back_ios,
            color: color,
          ),
        )
      : IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.arrow_back,
            color: color,
          ),
        );
}

Widget errorText(String errorMessage) {
  return Center(child: CustomText(errorMessage));
}

logControl(String message) {
  developer.log(message);
}

void logError(String? value) => developer.log("[ERROR] ${value ?? ""}");

animatedRouting({
  required GoRouterState state,
  required Widget route,
}) =>
    CustomTransitionPage<void>(
      key: state.pageKey,
      child: route,
      transitionsBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation, Widget child) =>
          SlideTransition(
        position: animation.drive(
          Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.fastOutSlowIn)),
        ),
        child: child,
      ),
    );
