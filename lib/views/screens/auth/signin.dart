import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constant/approute.dart';
import '../../../core/constant/imageassets.dart';
import '../../../core/function/mediaqueryfun.dart';
import '../../../core/services/checkconnection.dart';
import '../../widgets/cutomformfaild.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> _form_state = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: SingleChildScrollView(
        child: SafeArea(
          child: Form(
              key: _form_state,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  Text("Welcome SignUp",
                      style: TextStyle(
                          fontSize: mediaQuereyFun(size.width, 6, 0),
                          fontWeight: FontWeight.bold)),
                  Image.asset(AppImageAssets.signin, fit: BoxFit.fill),
                  CutomTextForm(
                    size: size,
                    textEditingController: name,
                    type: 3,
                    hint: "Name",
                  ),
                  CutomTextForm(
                    size: size,
                    textEditingController: email,
                    type: 1,
                    hint: "Email",
                  ),
                  CutomTextForm(
                      size: size,
                      textEditingController: password,
                      type: 2,
                      hint: "Password"),
                  MaterialButton(
                    padding: EdgeInsets.symmetric(
                        horizontal: mediaQuereyFun(size.width, 13, 0)),
                    color: const Color.fromARGB(255, 108, 99, 255),
                    onPressed: () async {
                      final bool isConnected =
                          await InternetConnectionChecker().hasConnection;

                      bool flag = false;
                      print(_form_state.currentState!.validate());
                      var formdata = _form_state.currentState;
                      if (isConnected) {
                        if (formdata!.validate()) {
                          try {
                            //checkconncetion();
                            UserCredential credential = await FirebaseAuth
                                .instance
                                .createUserWithEmailAndPassword(
                              email: email.text,
                              password: password.text,
                            );
                            print("${credential.user!.uid}");
                            // ignore: avoid_single_cascade_in_expression_statements, use_build_context_synchronously
                            AwesomeDialog(
                              context: context,
                              keyboardAware: true,
                              dismissOnBackKeyPress: false,
                              dialogType: DialogType.success,
                              animType: AnimType.bottomSlide,
                              title: 'Account Created',
                              // padding: const EdgeInsets.all(5.0),
                              desc: 'Welocme to Our App',
                              btnOkOnPress: () {
                                flag = true;
                                Navigator.pushReplacementNamed(
                                    context, AppRoute.homepage);
                              },
                            )..show();
                            // ignore: use_build_context_synchronously
                            Future.delayed(const Duration(milliseconds: 2000),
                                () {
                              Navigator.pushReplacementNamed(
                                  context, AppRoute.homepage);
                            });
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              print('The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              print(
                                  'The account already exists for that email.');
                            }
                          } catch (e) {
                            print(e);
                          }
                        } else {
                          print("valid");
                        }
                      } else {
                        // ignore: avoid_single_cascade_in_expression_statements
                        AwesomeDialog(
                          context: context,
                          keyboardAware: true,
                          dismissOnBackKeyPress: false,
                          dialogType: DialogType.warning,
                          animType: AnimType.bottomSlide,
                          title: 'Connection Error plz Check Network',
                          // padding: const EdgeInsets.all(5.0),
                          desc: 'Enable Mobile Data or Wi-Fi',
                          btnOkOnPress: () {},
                        )..show();
                      }
                    },
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: mediaQuereyFun(size.width, 5, 0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Created by Mostafa Wahid",
                      style: TextStyle(fontSize: 10)),
                ],
                //key: form_state,
              )),
        ),
      )),
    );
  }
}
