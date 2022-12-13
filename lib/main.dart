import 'package:bmi_check/core/init/theme/theme_data.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'core/init/dependency_injector.dart';
import 'core/init/main_build/main_build.dart';
import 'core/init/routes/routes.dart';
import 'firebase_options.dart';

void main() async {
 _init();
  runApp(
    MultiProvider(
      providers: DependencyInjector.instance.otherProviders,
      child: const MyApp(),
    ),
  );
}

Future<void> _init() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        final botToastBuilder = BotToastInit();
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'My BMI Checker',
          theme: AppThemeLight.instance.theme,
          routerConfig: Routes.instance.routes,
          builder: (context, child) => botToastBuilder(
            context,
            MainBuild(child: child),
          ),
        );
      },
    );
  }
}
