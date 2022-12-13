import 'package:bmi_check/core/utils/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:kartal/kartal.dart';

import '../../constants/app/app_constants.dart';
import '../text/custom_text.dart';

class CustomDropdown extends StatefulWidget {
  final String? value;
  final StringFunction onChanged;
  final List<String> items;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? iconColor;
  final BorderRadius? borderRadius;
  final String? hint;
  final String? title;

  const CustomDropdown(
      {Key? key,
      this.title,
      this.value,
      required this.items,
      this.onChanged,
      this.height = 5.5,
      this.width = 20,
      this.iconColor,
      this.backgroundColor,
      this.borderRadius,
      this.hint})
      : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: CustomText(
                  widget.title!,
                  textStyle: context.textTheme.bodyText2,
                ),
              )
            : const SizedBox.shrink(),
        Container(
          height: widget.height?.h,
          width: widget.width?.w,
          decoration: BoxDecoration(
            color: widget.backgroundColor!,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String?>(
              enableFeedback: true,
              hint: widget.hint != null
                  ? Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Center(
                        child: CustomText(
                          widget.hint!,
                          textStyle: context.textTheme.subtitle2?.copyWith(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    )
                  : null,
              value: widget.value,
              onChanged: widget.onChanged,
              icon: Icon(
                Icons.keyboard_arrow_down,
                size: 20.sp,
                color: widget.iconColor,
              ),
              items: widget.items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  enabled: true,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      value,
                      textStyle: TextStyle(
                        color: AppConstants.instance.mineShaft,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
