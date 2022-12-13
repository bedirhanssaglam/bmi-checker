import 'package:bmi_check/core/extensions/num_extensions.dart';
import 'package:bmi_check/core/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import '../../../core/components/text/custom_text.dart';
import '../../../core/constants/app/app_constants.dart';

class AdviceCard extends StatefulWidget {
  const AdviceCard({
    Key? key,
    required this.text,
    required this.onTap,
    required this.imagePath,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;
  final String imagePath;

  @override
  State<AdviceCard> createState() => _AdviceCardState();
}

class _AdviceCardState extends State<AdviceCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 15.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: AppConstants.instance.spectra,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          children: [
            3.w.pw,
            Image.asset(
              widget.imagePath.toGif,
              height: 10.h,
              width: 20.w,
            ),
            CustomText(
              widget.text,
              textStyle: context.textTheme.headline1?.copyWith(
                color: AppConstants.instance.wildSand,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
