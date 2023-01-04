import 'package:bmi_check/core/components/text/custom_text.dart';
import 'package:bmi_check/core/constants/enums/image_enums.dart';
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

import '../../core/base/singleton/base_singleton.dart';
import '../../core/constants/enums/navigation_enums.dart';

class IntroView extends StatelessWidget with BaseSingleton {
  IntroView({super.key});

  final PageController pageController = PageController(initialPage: 0);

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
                      itemCount: constants.splashData.length,
                      itemBuilder: (context, index) => IntroHeader(
                        image: constants.splashData[index]["image"]!,
                        text: constants.splashData[index]['text']!,
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
                                constants.splashData.length,
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
                                      color: constants.spectra,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  2.w.pw,
                                  SvgPicture.asset(
                                    ImageEnums.arrowForward.imageName.toSvg,
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
            ? constants.spectra
            : constants.silver,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
