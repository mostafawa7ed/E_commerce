// ignore_for_file: avoid_unnecessary_containers
import 'package:app/Blocs/pagecounter/export_page_counter.dart';
import 'package:app/core/constant/approute.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/Colors.dart';
import '../../../data/datasource/static/static.dart';

// ignore: non_constant_identifier_names
PageController pageController = PageController();
bool buttomclick = false;
PageCouterBloc pageCouterBloc = PageCouterBloc();
int i = 1;
// ignore: non_constant_identifier_names
Widget GenratePage() {
  int oldPage = 0;
  return BlocBuilder<PageCouterBloc, PageCouterState>(
    builder: (context, state) {
      return PageView.builder(
          controller: pageController,
          onPageChanged: (val) {
            if (val > oldPage) {
              context.read<PageCouterBloc>().add(IncreasePageEvent());
              oldPage = val;
            } else if (val == oldPage) {
              oldPage = val;
              context.read<PageCouterBloc>().add(DecreasePageEvent());
            } else {
              context.read<PageCouterBloc>().add(DecreasePageEvent());
              oldPage = val;
            }
            i = val + 1;
          },
          itemCount: onBordingModelList.length,
          itemBuilder: (context, i) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text("${onBordingModelList[i].title}",
                    style: Theme.of(context).textTheme.displayLarge),
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
                      style: Theme.of(context).textTheme.displaySmall),
                )
              ],
            );
          });
    },
  );
}

// ignore: non_constant_identifier_names
Widget GenerateDotController() {
  //Get.find();
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ...List.generate(onBordingModelList.length, (index) {
        return BlocBuilder<PageCouterBloc, PageCouterState>(
          builder: (context, state) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 900),
              margin: const EdgeInsets.only(right: 5, left: 5),
              width: state.index == index ? 20 : 10,
              height: 6,
              decoration: BoxDecoration(
                  color: AppColor.blueAccent,
                  borderRadius: BorderRadius.circular(10)),
            );
          },
        );
      })
    ],
  );
}

// ignore: non_constant_identifier_names
Widget OnBordingButtom() {
  return Container(
    child: BlocBuilder<PageCouterBloc, PageCouterState>(
      builder: (context, state) {
        return MaterialButton(
          onPressed: () {
            if (state.index == 3) {
              Navigator.of(context).pushReplacementNamed(AppRoute.login);
            } else {
              pageController.animateToPage(i,
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.easeInOut);
            }
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
        );
      },
    ),
  );
}
