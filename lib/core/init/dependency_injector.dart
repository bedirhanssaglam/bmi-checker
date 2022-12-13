import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../view/intro/provider/current_page.dart';

class DependencyInjector {
  static DependencyInjector? _instance;

  static DependencyInjector get instance {
    _instance ??= DependencyInjector._init();
    return _instance!;
  }

  DependencyInjector._init();

  List<ChangeNotifierProvider<ChangeNotifier>> get otherProviders => [
        ChangeNotifierProvider<CurrentPageProvider>(
            create: (context) => CurrentPageProvider()),
      ];
}
