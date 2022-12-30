import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constant/Colors.dart';
import '../../data/datasource/static/static.dart';

class OnBoading extends StatelessWidget {
  const OnBoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.white,
        body: SafeArea(
          child: PageView.builder(
              itemCount: onBordingModelList.length,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text("${onBordingModelList[i].title}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 40,
                    ),
                    Image.asset("${onBordingModelList[i].image}"),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: Text("${onBordingModelList[i].body}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              height: 2,
                              color: AppColor.black54,
                              fontSize: 17)),
                      width: double.infinity,
                    )
                  ],
                );
              }),
        ));
  }
}
