import 'package:bmi_check/core/constants/enums/image_enums.dart';
import 'package:bmi_check/core/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../base/functions/base_functions.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    this.isHomeView = false,
  }) : super(key: key);

  final bool? isHomeView;

  @override
  State<AppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Image.asset(
        ImageEnums.appbar.imageName.toPng,
        height: 6.h,
      ),
      elevation: 3,
      leading: !widget.isHomeView!
          ? platformBackButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
            )
          : null,
    );
  }
}
