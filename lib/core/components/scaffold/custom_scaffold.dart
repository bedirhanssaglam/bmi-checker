import 'package:bmi_check/core/components/appbar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomScaffold extends StatefulWidget {
  final Widget body;
  final bool? isThereAppBar;
  final bool? isHomeView;

  const CustomScaffold({
    super.key,
    required this.body,
    this.isThereAppBar = true,
    this.isHomeView = false,
  });

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future.value(true);
      },
      child: Scaffold(
        appBar: widget.isThereAppBar!
            ? CustomAppBar(
                isHomeView: widget.isHomeView,
              )
            : null,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: SingleChildScrollView(
            child: widget.body,
          ),
        ),
      ),
    );
  }
}
