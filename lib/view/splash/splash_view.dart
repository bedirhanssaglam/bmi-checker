import 'package:bmi_check/core/components/text/custom_text.dart';
import 'package:bmi_check/core/constants/enums/navigation_enums.dart';
import 'package:bmi_check/core/extensions/string_extensions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:kartal/kartal.dart';

import '../../core/constants/app/app_constants.dart';
import '../../core/constants/enums/image_enums.dart';
import '../../firebase_options.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _init();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              ImageEnums.splash.imageName.toJson,
              controller: _controller,
              fit: BoxFit.cover,
              height: 40.h,
              width: 80.w,
              animate: true,
              onLoaded: (composition) {
                _controller
                  ..duration = composition.duration
                  ..forward().whenComplete(
                    () => context.go(
                      NavigationEnums.intro.routeName,
                    ),
                  );
              },
            ),
            CustomText(
              AppConstants.instance.appName,
              textStyle: context.textTheme.headline2?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
