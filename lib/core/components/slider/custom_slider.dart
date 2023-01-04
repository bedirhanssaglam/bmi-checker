import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import '../../base/singleton/base_singleton.dart';
import '../../utils/typedefs.dart';
import '../text/custom_text.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({
    Key? key,
    required this.currentValue,
    required this.onChanged,
    this.unit = "kg",
    this.title = "",
    this.min = 10,
    this.max = 220,
  }) : super(key: key);

  final double currentValue;
  final String? unit;
  final DoubleFunction onChanged;
  final String? title;
  final double? min;
  final double? max;

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> with BaseSingleton {
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
          height: 5.h,
          decoration: BoxDecoration(
            color: constants.spectra.withOpacity(.3),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Slider(
            inactiveColor: constants.spectra.withOpacity(.4),
            activeColor: constants.spectra,
            value: widget.currentValue,
            min: widget.min!,
            max: widget.max!,
            divisions: (widget.max! - widget.min!).toInt(),
            label: "${widget.currentValue.round().toString()} ${widget.unit}",
            onChanged: widget.onChanged,
          ),
        ),
      ],
    );
  }
}
