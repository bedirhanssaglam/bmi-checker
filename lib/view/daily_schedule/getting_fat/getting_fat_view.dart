import 'package:bmi_check/core/components/text/custom_text.dart';
import 'package:bmi_check/core/extensions/string_extensions.dart';
import 'package:bmi_check/view/daily_schedule/getting_fat/widgets/getting_fat_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/functions/base_functions.dart';
import '../../../core/base/service/fire_service.dart';
import '../../../core/constants/enums/navigation_enums.dart';

class GettingFatView extends StatefulWidget {
  const GettingFatView({super.key});

  @override
  State<GettingFatView> createState() => _GettingFatViewState();
}

class _GettingFatViewState extends State<GettingFatView> {
  final FireService _fireService = FireService();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: SingleChildScrollView(
            child: Center(
              child: StreamBuilder<QuerySnapshot>(
                stream: _fireService.fetchGettingFatAdvices(),
                builder: (context, snapshot) {
                  return !snapshot.hasData
                      ? platformIndicator()
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot doc = snapshot.data!.docs[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 1.h),
                                    child: CustomText(
                                      "Day ${index + 1}",
                                      textStyle: context.textTheme.headline1,
                                    ),
                                  ),
                                  GettingFatCard(doc: doc),
                                ],
                              ),
                            );
                          },
                        );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Image.asset(
        "appbar".toPng,
        height: 6.h,
      ),
      elevation: 3,
      leading: platformBackButton(
        onPressed: () {
          context.go(NavigationEnums.home.routeName);
        },
      ),
    );
  }
}
