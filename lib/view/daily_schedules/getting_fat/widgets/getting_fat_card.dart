import 'package:bmi_check/core/extensions/num_extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/base/singleton/base_singleton.dart';
import '../../../../core/components/text/custom_text.dart';

class GettingFatCard extends StatelessWidget with BaseSingleton {
  const GettingFatCard({
    Key? key,
    required this.doc,
  }) : super(key: key);

  final DocumentSnapshot<Object?> doc;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41.h,
      width: double.infinity,
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        color: constants.spectra.withOpacity(.5),
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
            "SNACK: ${doc['snack']}",
          ),
          1.h.ph,
          CustomText(
            "LUNCH: ${doc['lunch']}",
          ),
          1.h.ph,
          CustomText(
            "SNACK: ${doc['second_snack']}",
          ),
          1.h.ph,
          CustomText(
            "DINNER: ${doc['dinner']}",
          ),
          1.h.ph,
          CustomText(
            "SNACK: ${doc['third_snack']}",
          ),
          1.h.ph,
        ],
      ),
    );
  }
}
