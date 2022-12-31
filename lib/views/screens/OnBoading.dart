import 'package:app/controller/onbordingcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/Colors.dart';
import '../widgets/onbording/onbondingwidget.dart';

class OnBoading extends GetView<OnBordingControllerImp> {
  const OnBoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBordingControllerImp());
    return Scaffold(
        backgroundColor: AppColor.white,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: GenratePage(),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    GenerateDotController(),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    OnBordingButtom(),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
