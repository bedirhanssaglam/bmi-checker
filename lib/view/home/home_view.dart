import 'package:bmi_check/core/components/textFormField/validate_operation.dart';
import 'package:bmi_check/core/constants/enums/image_enums.dart';
import 'package:flutter/material.dart';
import 'package:bmi_check/core/components/button/button_widget.dart';
import 'package:bmi_check/core/components/dropdownButton/custom_dropdown.dart';
import 'package:bmi_check/core/components/text/custom_text.dart';
import 'package:bmi_check/core/components/textFormField/text_form_field_widget.dart';
import 'package:bmi_check/core/extensions/num_extensions.dart';
import 'package:bmi_check/core/utils/calculator.dart';
import 'package:flutter/services.dart';
import '../../core/base/singleton/base_singleton.dart';
import '../../core/components/scaffold/custom_scaffold.dart';
import '../../core/components/slider/custom_slider.dart';
import '../../core/constants/enums/navigation_enums.dart';
import 'widgets/advice_card.dart';
import 'widgets/blog_card.dart';

import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:kartal/kartal.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with BaseSingleton {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  double _currentHeightValue = 100;
  double _currentWeightValue = 50;
  List<String> genderList = ["Male", "Female"];
  String gender = "Male";

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isHomeView: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          3.h.ph,
          AdviceCard(
            onTap: () {
              context.go(NavigationEnums.weaken.routeName);
            },
            text: "Do you want to lose weight?\nTake a look at our advices!",
            imagePath: ImageEnums.running.imageName,
          ),
          3.h.ph,
          CustomText(
            "Blog Posts",
            textStyle: context.textTheme.headline2,
          ),
          2.h.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlogCard(
                onTap: () {
                  context.push(
                      "${NavigationEnums.blog.routeName}/?isSportBlog=true");
                },
                imagePath: ImageEnums.sport.imageName,
                title: "Sport",
              ),
              BlogCard(
                onTap: () {
                  context.push(
                      "${NavigationEnums.blog.routeName}/?isSportBlog=false");
                },
                imagePath: ImageEnums.sleeping.imageName,
                title: "Sleeping",
              ),
            ],
          ),
          4.h.ph,
          CustomText(
            "Calculate your BMI",
            textStyle: context.textTheme.headline2,
          ),
          2.h.ph,
          Form(
            key: _formKey,
            child: TextFormFieldWidget(
              textEditingController: nameController,
              title: "Your name",
              hintText: "John",
              onSaved: (value) {
                nameController.text = value!;
              },
              inputFormatters: [
                LengthLimitingTextInputFormatter(28),
              ],
              validator: (value) =>
                  validateOperation(value, "It cannot be empty."),
            ),
          ),
          2.h.ph,
          CustomSlider(
            title: "Your height (cm)",
            unit: "cm",
            currentValue: _currentHeightValue,
            onChanged: (value) {
              setState(() {
                _currentHeightValue = value;
              });
            },
          ),
          2.h.ph,
          CustomSlider(
            title: "Your weight (kg)",
            max: 150,
            currentValue: _currentWeightValue,
            onChanged: (value) {
              setState(() {
                _currentWeightValue = value;
              });
            },
          ),
          2.h.ph,
          CustomDropdown(
            title: "Your gender",
            hint: "Male",
            value: gender,
            iconColor: constants.spectra,
            width: 40,
            backgroundColor: constants.wildSand,
            items: genderList.map((item) => item).toList(),
            onChanged: (value) {
              setState(() {
                gender = value!;
              });
            },
          ),
          2.h.ph,
          ButtonWidget(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                final calculator = Calculator(
                  height: _currentHeightValue.toInt(),
                  weight: _currentWeightValue.toInt(),
                );
                final bmi = calculator.calculate();
                final status = calculator.getStatus();
                final explanation = calculator.getExplanation();
                final name = nameController.text;
                context.push(
                  "/result/$bmi/$name/$status/$explanation/$gender",
                );
              } else {}
            },
            text: "Calculate",
            buttonColor: constants.spectra,
          ),
          3.h.ph,
        ],
      ),
    );
  }
}
