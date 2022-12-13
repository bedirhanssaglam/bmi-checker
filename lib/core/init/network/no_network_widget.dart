import 'package:bmi_check/core/extensions/num_extensions.dart';
import 'package:bmi_check/core/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../components/text/custom_text.dart';
import '../../constants/app/app_constants.dart';
import '../../constants/enums/network_result_enums.dart';
import 'network_change_manager.dart';

class NoNetworkWidget extends StatefulWidget {
  const NoNetworkWidget({super.key});

  @override
  State<NoNetworkWidget> createState() => _NoNetworkWidgetState();
}

class _NoNetworkWidgetState extends State<NoNetworkWidget>
    with TickerProviderStateMixin {
  late final INetworkChangeManager _networkChange;
  late final AnimationController _controller;
  NetworkResultEnums? _networkResult;

  @override
  void initState() {
    super.initState();
    _networkChange = NetworkChangeManager();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _networkChange.handleNetworkChange((result) {
        _updateView(result);
      });
    });
    _controller = AnimationController(
      duration: const Duration(milliseconds: 0),
      vsync: this,
    );
  }

  Future<void> fetchFirstResult() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final result = await _networkChange.checkNetworkFirstTime();
      _updateView(result);
    });
  }

  void _updateView(NetworkResultEnums result) {
    setState(() {
      _networkResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return AnimatedCrossFade(
      duration: const Duration(seconds: 0),
      crossFadeState: _networkResult == NetworkResultEnums.off
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      firstChild: Material(
        color: Colors.white,
        child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                "no_network".toJson,
                controller: _controller,
                fit: BoxFit.cover,
                height: 30.h,
                animate: true,
                onLoaded: (composition) {
                  _controller
                    ..duration = composition.duration
                    ..repeat();
                },
              ),
              2.h.ph,
              CustomText(
                'Sorry, we cannot perform the action you requested\nat the moment. Please check your internet\nconnection.',
                textStyle: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  color: AppConstants.instance.mineShaft,
                ),
              ),
            ],
          ),
        ),
      ),
      secondChild: const SizedBox.shrink(),
    );
  }
}
