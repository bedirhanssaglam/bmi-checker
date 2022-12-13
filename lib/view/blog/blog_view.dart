import 'package:bmi_check/core/constants/enums/image_enums.dart';
import 'package:flutter/material.dart';
import 'package:bmi_check/core/components/scaffold/custom_scaffold.dart';
import 'package:bmi_check/core/components/text/custom_text.dart';
import 'package:bmi_check/core/extensions/num_extensions.dart';
import 'package:bmi_check/core/extensions/string_extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sizer/sizer.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/functions/base_functions.dart';
import '../../core/base/service/fire_service.dart';

class BlogView extends StatefulWidget {
  const BlogView({
    super.key,
    required this.isSportBlog,
  });

  final bool isSportBlog;

  @override
  State<BlogView> createState() => _BlogViewState();
}

class _BlogViewState extends State<BlogView> {
  final FireService fireService = FireService();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          3.h.ph,
          CustomText(
            widget.isSportBlog ?
            "The Importance of Doing Sports" :
            "The Importance of Sleep",
            textStyle: context.textTheme.headline3,
          ),
          2.h.ph,
          Image.asset(
          (  widget.isSportBlog ? ImageEnums.sportBlog.imageName :
           ImageEnums.sleepBlog.imageName).toJpg,
            height: 30.h,
            width: double.infinity,
          ),
          2.h.ph,
          StreamBuilder<DocumentSnapshot>(
            stream: widget.isSportBlog
                ? fireService.fetchSportBlog()
                : fireService.fetchSleepBlog(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                String title = snapshot.data?['title'];
                return CustomText(
                  title,
                  textStyle: context.textTheme.bodyText2?.copyWith(
                    fontWeight: FontWeight.w500,
                    height: 1.8,
                  ),
                );
              } else if (snapshot.hasError) {
                return errorText("Something went wrong!");
              } else {
                return platformIndicator();
              }
            },
          ),
          3.h.ph,
        ],
      ),
    );
  }
}
