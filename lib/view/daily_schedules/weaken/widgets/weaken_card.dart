import 'package:bmi_check/core/extensions/num_extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/components/text/custom_text.dart';
import '../../../../core/constants/app/app_constants.dart';

class WeakenCard extends StatelessWidget {
  const WeakenCard({
    Key? key,
    required this.doc,
    required this.index,
  }) : super(key: key);

  final DocumentSnapshot<Object?> doc;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: CustomText(
              "Day ${index + 1}",
              textStyle: context.textTheme.headline1,
            ),
          ),
          Container(
            height: 27.h,
            width: double.infinity,
            padding: EdgeInsets.all(8.sp),
            decoration: BoxDecoration(
              color: AppConstants.instance.spectra.withOpacity(.5),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                1.h.ph,
                CustomText(
                  "BREAKFAST: ${doc['breakfast']}",
                ),
                1.h.ph,
                CustomText(
                  "LUNCH: ${doc['lunch']}",
                ),
                1.h.ph,
                CustomText(
                  "DINNER: ${doc['dinner']}",
                ),
                1.h.ph,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
