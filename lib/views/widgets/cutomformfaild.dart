import 'package:app/core/function/vaildator_fun.dart';
import 'package:flutter/material.dart';
import '../../core/constant/Colors.dart';
import '../../core/function/mediaqueryfun.dart';

class CutomTextForm extends StatelessWidget {
  const CutomTextForm({
    super.key,
    required this.size,
    required this.textEditingController,
    required this.type,
    required this.hint,
  });

  final Size size;
  final TextEditingController textEditingController;
  final int type;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: mediaQuereyFun(size.width, 5, 0),
          vertical: mediaQuereyFun(size.height, 1, 1)),
      child: TextFormField(
        obscureText: type == 2 ? true : false,
        controller: textEditingController,
        validator: (value) {
          return valdator_function(value.toString(), type);
        },
        decoration: InputDecoration(
            hintText: hint,
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2),
                borderRadius: BorderRadius.circular(15)),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  const BorderSide(color: AppColor.blueAccent, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2),
                borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColor.blueAccent, width: 2),
                borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
