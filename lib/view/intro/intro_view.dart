import 'package:bmi_check/core/components/text/custom_text.dart';
import 'package:bmi_check/core/extensions/num_extensions.dart';
import 'package:bmi_check/core/extensions/string_extensions.dart';
import 'package:bmi_check/view/intro/provider/current_page.dart';
import 'package:bmi_check/view/intro/widgets/intro_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:kartal/kartal.dart';

import '../../core/constants/app/app_constants.dart';
import '../../core/constants/enums/navigation_enums.dart';

class IntroView extends StatelessWidget {
  IntroView({super.key});

  final PageController pageController = PageController(initialPage: 0);

  final List<Map<String, String>> splashData = [
    {
      "text":
          "Health has a special importance in maintaining human life, improving and protecting the quality of life.It should not be forgotten that the protection and development of health is possible primarily by the person taking care of his own health and developing health awareness.",
      "image": "first_intro",
    },
    {
      "text":
          "With this application you will use, you will be able to calculate your body mass index, read blog posts and access the sample diet program. After the reminder text, let's get started!",
      "image": "second_intro"
    },
    {
      "text":
          "The data are calculated according to the figures published by the World Health Organization. This calculation is for information purposes. Consult your physician for medical diagnosis and treatment.",
      "image": "third_intro"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              1.h.ph,
              Expanded(
                flex: 8,
                child: Consumer<CurrentPageProvider>(
                  builder: (context, value, child) {
                    return PageView.builder(
                      controller: pageController,
                      onPageChanged: (value) {
                        context
                            .read<CurrentPageProvider>()
                            .setCurrentPage(value);
                      },
                      itemCount: splashData.length,
                      itemBuilder: (context, index) => IntroHeader(
                        image: splashData[index]["image"]!,
                        text: splashData[index]['text']!,
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    40.w.pw,
                    Consumer<CurrentPageProvider>(
                      builder: (context, value, child) {
                        return Row(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                splashData.length,
                                (index) {
                                  return buildPageDots(context, index);
                                },
                              ),
                            ),
                            22.w.pw,
                            InkWell(
                              onTap: () =>
                                  context.go(NavigationEnums.home.routeName),
                              child: Row(
                                children: [
                                  CustomText(
                                    "Skip",
                                    textStyle:
                                        context.textTheme.headline1?.copyWith(
                                      color: AppConstants.instance.spectra,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  2.w.pw,
                                  SvgPicture.asset(
                                    "arrow_forward".toSvg,
                                    height: 13.sp,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildPageDots(BuildContext context, int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.only(right: 1.w),
      height: 1.5.w,
      width: context.watch<CurrentPageProvider>().currentPage == index
          ? 6.w
          : 2.5.w,
      decoration: BoxDecoration(
        color: context.watch<CurrentPageProvider>().currentPage == index
            ? AppConstants.instance.spectra
            : AppConstants.instance.silver,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
