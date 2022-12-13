import 'package:bmi_check/core/constants/enums/navigation_enums.dart';
import 'package:bmi_check/core/extensions/string_extensions.dart';
import 'package:bmi_check/view/daily_schedule/weaken/widgets/weaken_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../core/base/functions/base_functions.dart';
import '../../../core/base/service/fire_service.dart';

class WeakenView extends StatefulWidget {
  const WeakenView({super.key});

  @override
  State<WeakenView> createState() => _WeakenViewState();
}

class _WeakenViewState extends State<WeakenView> {
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
                stream: _fireService.fetchWeakenAdvices(),
                builder: (context, snapshot) {
                  return !snapshot.hasData
                      ? platformIndicator()
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot doc = snapshot.data!.docs[index];
                            return WeakenCard(doc: doc, index: index);
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
