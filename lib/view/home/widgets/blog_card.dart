import 'package:bmi_check/core/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import '../../../core/base/singleton/base_singleton.dart';
import '../../../core/components/text/custom_text.dart';

class BlogCard extends StatelessWidget with BaseSingleton {
  const BlogCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String imagePath;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 22.h,
        width: 43.w,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: constants.spectra,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 3,
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Opacity(
                opacity: .5,
                child: Image.asset(
                  imagePath.toPng,
                ),
              ),
            ),
            Positioned(
              bottom: 1.h,
              right: 9.w,
              child: Container(
                height: 4.h,
                width: 25.w,
                decoration: BoxDecoration(
                  color: constants.wildSand.withOpacity(.5),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomText(
                        title,
                        textStyle: context.textTheme.headline1?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 15.sp,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
