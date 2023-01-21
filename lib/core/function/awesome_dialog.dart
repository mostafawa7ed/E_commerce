import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
void awesomeshow(BuildContext context){
            AwesomeDialog(
                      context: context,
                      keyboardAware: true,
                      dismissOnBackKeyPress: false,
                      dialogType: DialogType.warning,
                      animType: AnimType.bottomSlide,
                      btnCancelText: "Cancel Order",
                      btnOkText: "Yes, I will pay",
                      title: 'Continue to pay?',
                      // padding: const EdgeInsets.all(5.0),
                      desc:
                          'Please confirm that you will pay 3000 INR within 30 mins. Creating orders without paying will create penalty charges, and your account may be disabled.',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    )..show();
}