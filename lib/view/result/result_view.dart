import 'package:bmi_check/core/constants/enums/image_enums.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import 'package:bmi_check/core/components/animatedText/animated_text.dart';
import 'package:bmi_check/core/components/button/button_widget.dart';
import 'package:bmi_check/core/components/text/custom_text.dart';
import 'package:bmi_check/core/constants/app/app_constants.dart';
import 'package:bmi_check/core/constants/enums/navigation_enums.dart';
import 'package:bmi_check/core/extensions/num_extensions.dart';
import 'package:bmi_check/view/home/widgets/advice_card.dart';

import '../../core/components/scaffold/custom_scaffold.dart';

class ResultView extends StatelessWidget {
  const ResultView({
    Key? key,
    this.bmi,
    this.name,
    required this.status,
    required this.explanation,
    required this.gender,
  }) : super(key: key);

  final String? bmi;
  final String? name;
  final String status;
  final String explanation;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          2.h.ph,
          CustomText(
            "Results",
            textStyle: context.textTheme.headline2?.copyWith(
              color: AppConstants.instance.spectra,
            ),
          ),
          2.h.ph,
          Container(
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
          ),
          2.h.ph,
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                CustomText(
                  "BMI : $bmi",
                  textStyle: context.textTheme.headlineMedium,
                ),
                CustomText(
                  '($status)',
                ),
              ],
            ),
          ),
          1.5.h.ph,
          ButtonWidget(
            onTap: () => context.go(NavigationEnums.home.routeName),
            text: "Recalculate",
            buttonColor: AppConstants.instance.spectra,
          ),
          3.h.ph,
          CustomText(
            "You may be interested",
            textStyle: context.textTheme.headline2?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          2.h.ph,
          AdviceCard(
            onTap: () => context.go(NavigationEnums.weaken.routeName),
            imagePath: ImageEnums.running.imageName,
            text: "Do you want to lose weight?\nCheck out our suggestions now!",
          ),
          3.h.ph,
          AdviceCard(
            onTap: () => context.go(NavigationEnums.gettingFat.routeName),
            imagePath: ImageEnums.eating.imageName,
            text: "Do you want to gain weight?\nCheck out our suggestions now!",
          ),
        ],
      ),
    );
  }
}
