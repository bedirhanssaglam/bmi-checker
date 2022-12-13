import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../text/custom_text.dart';

class ButtonWidget extends StatefulWidget {
  final String? text;
  final double? width;
  final double? height;
  final double? radius;
  final VoidCallback onTap;
  final Color? iconColor;
  final IconData? icon;
  final double? fontSize;
  final Color? textColor;
  final Color? buttonColor;
  final bool? isBold;
  final bool isCircleButton;
  final FontWeight? fontWeight;
  final double? iconSize;
  final bool? isTherePadding;
  final double? width2;
  final String? path;
  final bool? isGradient;
  final bool? isBorder;
  final Color? firstGradient;
  final Color? secondGradient;
  final bool? isFirstIcon;

  const ButtonWidget({
    Key? key,
    this.text = "",
    this.width = double.infinity,
    this.width2 = 1,
    this.height = 5.5,
    this.buttonColor,
    required this.onTap,
    this.radius = 10,
    this.path,
    this.iconColor,
    this.icon,
    this.fontSize = 11,
    this.textColor = Colors.white,
    this.isBold = true,
    this.fontWeight = FontWeight.w600,
    this.iconSize = 0.025,
    this.isTherePadding = true,
    this.isGradient = false,
    this.isCircleButton = false,
    this.isBorder = false,
    this.firstGradient,
    this.secondGradient,
    this.isFirstIcon = true,
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return GestureDetector(
      onTapDown: _tapDown,
      onTapUp: _tapUp,
      onTap: widget.onTap,
      child: Transform.scale(
        scale: _scale,
        child: Padding(
          padding: EdgeInsets.all(widget.isTherePadding == true ? 8.0 : 2),
          child: Container(
            height: widget.height?.h,
            width: widget.width?.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: widget.isGradient!
                    ? <Color>[
                        widget.firstGradient!,
                        widget.secondGradient!,
                      ]
                    : [
                        widget.buttonColor!,
                        widget.buttonColor!,
                      ],
              ),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(1, 1),
                  color: Colors.white12,
                  blurRadius: 2,
                  spreadRadius: 2,
                ),
              ],
              borderRadius: BorderRadius.circular(widget.radius!),
            ),
            child: Center(
              child: CustomText(
                widget.text!,
                textStyle: TextStyle(
                    color: widget.textColor,
                    fontWeight: widget.fontWeight,
                    fontSize: widget.fontSize?.sp),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
