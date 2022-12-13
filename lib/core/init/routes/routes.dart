import 'package:bmi_check/view/blog/blog_view.dart';
import 'package:bmi_check/view/home/home_view.dart';
import 'package:bmi_check/view/splash/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../view/daily_schedules/getting_fat/getting_fat_view.dart';
import '../../../view/daily_schedules/weaken/weaken_view.dart';
import '../../../view/intro/intro_view.dart';
import '../../../view/result/result_view.dart';
import '../../base/functions/base_functions.dart';
import '../../constants/enums/navigation_enums.dart';

final GlobalKey<NavigatorState> mainNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'main');

class Routes {
  static Routes? _instance;
  static Routes get instance {
    _instance ??= Routes._init();
    return _instance!;
  }

  Routes._init();

  GoRouter routes = GoRouter(
    navigatorKey: mainNavigatorKey,
    initialLocation: NavigationEnums.splash.routeName,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: NavigationEnums.splash.routeName,
        pageBuilder: (context, state) {
          return animatedRouting(
            state: state,
            route: const SplashView(),
          );
        },
      ),
      GoRoute(
        path: NavigationEnums.intro.routeName,
        pageBuilder: (context, state) {
          return animatedRouting(
            state: state,
            route: IntroView(),
          );
        },
      ),
      GoRoute(
        path: NavigationEnums.home.routeName,
        pageBuilder: (context, state) {
          return animatedRouting(
            state: state,
            route: const HomeView(),
          );
        },
      ),
      GoRoute(
        path: NavigationEnums.result.routeName,
        pageBuilder: (context, state) {
          return animatedRouting(
            state: state,
            route: ResultView(
              bmi: state.params['bmi']!,
              name: state.params['name'],
              status: state.params['status']!,
              explanation: state.params['explanation']!,
              gender: state.params['gender']!,
            ),
          );
        },
      ),
      GoRoute(
        path: NavigationEnums.blog.routeName,
        pageBuilder: (context, state) {
          return animatedRouting(
            state: state,
            route: BlogView(
              isSportBlog:
                  state.queryParams['isSportBlog'] == "true" ? true : false,
            ),
          );
        },
      ),
      GoRoute(
        path: NavigationEnums.gettingFat.routeName,
        pageBuilder: (context, state) {
          return animatedRouting(
            state: state,
            route: const GettingFatView(),
          );
        },
      ),
      GoRoute(
        path: NavigationEnums.weaken.routeName,
        pageBuilder: (context, state) {
          return animatedRouting(
            state: state,
            route: const WeakenView(),
          );
        },
      ),
    ],
  );
}
