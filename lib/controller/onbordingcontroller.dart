import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBordingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBordingControllerImp extends OnBordingController {
  late PageController pageController;
  int currentPage = 0; //in inital
  @override
  next() {
    currentPage++;
    pageController.animateToPage(currentPage,
        duration: Duration(microseconds: 900), curve: Curves.easeInCubic);
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    //must add init to initaial Pagecontroller make a error
    pageController = PageController();
    super.onInit();
  }
}
