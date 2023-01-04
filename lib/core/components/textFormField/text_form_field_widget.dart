import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import '../../base/singleton/base_singleton.dart';
import '../../utils/typedefs.dart';
import '../text/custom_text.dart';

class TextFormFieldWidget extends StatelessWidget with BaseSingleton {
  final String? hintText;
  final double? width;
  final double? height;
  final StringFunction onSaved;
  final double? borderRadius;
  final TextInputType? textInputType;
  final String? title;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? hintTextFontWeight;
  final double? titleFontSize;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? textEditingController;
  final FormFieldValidator<String>? validator;

  const TextFormFieldWidget({
    Key? key,
    this.hintText,
    this.width = 90,
    this.height = 6,
    this.titleFontSize = 12,
    this.onSaved,
    this.textEditingController,
    this.borderRadius = 10,
    this.textInputType = TextInputType.text,
    this.title,
    this.fontSize = 11,
    this.textColor,
    this.inputFormatters,
    this.hintTextFontWeight = FontWeight.normal,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: CustomText(
                  title!,
                  textStyle: context.textTheme.bodyText2,
                ),
              )
            : const SizedBox.shrink(),
        TextFormField(
          controller: textEditingController,
          inputFormatters: inputFormatters,
          textAlignVertical: TextAlignVertical.center,
          keyboardType: textInputType,
          style: context.textTheme.headline2?.copyWith(
            fontSize: fontSize!.sp,
            fontWeight: hintTextFontWeight,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: constants.wildSand,
            hoverColor: constants.spectra,
            contentPadding: EdgeInsets.all(10.sp),
            hintStyle: context.textTheme.subtitle2?.copyWith(
                color: constants.emperor.withOpacity(.7),
                fontSize: fontSize!.sp,
                fontWeight: hintTextFontWeight),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
              borderSide: BorderSide(color: constants.carnation),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
              borderSide: BorderSide.none,
            ),
          ),
          onSaved: (value) {
            onSaved != null ? onSaved!(value) : null;
          },
          validator: validator,
        ),
      ],
    );
  }
}
