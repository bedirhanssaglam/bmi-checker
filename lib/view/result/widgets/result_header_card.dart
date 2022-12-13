import 'package:bmi_check/core/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import '../../../core/components/animatedText/animated_text.dart';
import '../../../core/components/text/custom_text.dart';
import '../../../core/constants/app/app_constants.dart';

class ResultHeaderCard extends StatelessWidget {
  const ResultHeaderCard({
    Key? key,
    this.name,
    required this.explanation,
  }) : super(key: key);

  final String? name;
  final String explanation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 17.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppConstants.instance.spectra.withOpacity(.2),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            1.h.ph,
            name != null
                ? AnimatedText(
                    "Dear $name,",
                    textStyle: context.textTheme.headline2,
                  )
                : const AnimatedText(
                    "Dear,",
                  ),
            1.h.ph,
            CustomText(
              explanation,
              textStyle: context.textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }
}
