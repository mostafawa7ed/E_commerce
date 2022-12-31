// ignore_for_file: avoid_unnecessary_containers

import 'package:app/controller/onbordingcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/Colors.dart';
import '../../../data/datasource/static/static.dart';

// ignore: non_constant_identifier_names
Widget GenratePage() {
  return GetBuilder<OnBordingControllerImp>(
      builder: (controller) => PageView.builder(
          controller: controller.pageController,
          onPageChanged: (val) {
            controller.onPageChanged(val);
          },
          itemCount: onBordingModelList.length,
          itemBuilder: (context, i) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text("${onBordingModelList[i].title}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 40,
                ),
                Image.asset("${onBordingModelList[i].image}"),
                const SizedBox(
                  height: 40,
                ),
                // ignore: sized_box_for_whitespace
                Container(
                  width: double.infinity,
                  child: Text("${onBordingModelList[i].body}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          height: 2, color: AppColor.black54, fontSize: 17)),
                )
              ],
            );
          }));
}

// ignore: non_constant_identifier_names
Widget GenerateDotController() {
  //Get.find();
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ...List.generate(onBordingModelList.length, (index) {
        return GetBuilder<OnBordingControllerImp>(
            builder: (controller) => AnimatedContainer(
                  duration: const Duration(milliseconds: 900),
                  margin: const EdgeInsets.only(right: 5, left: 5),
                  width: controller.currentPage == index ? 20 : 10,
                  height: 6,
                  decoration: BoxDecoration(
                      color: AppColor.blueAccent,
                      borderRadius: BorderRadius.circular(10)),
                ));
      })
    ],
  );
}

// ignore: non_constant_identifier_names
Widget OnBordingButtom() {
  return Container(
      child: GetBuilder<OnBordingControllerImp>(
    builder: (controller) => MaterialButton(
      onPressed: () {
        controller.next();
      },
      child: Container(
        width: 190,
        height: 30,
        decoration: BoxDecoration(
            color: AppColor.blueAccent,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                spreadRadius: 1,
                blurRadius: 5,
              )
            ]),
        child: const Text(
          "Continue",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  ));
}
