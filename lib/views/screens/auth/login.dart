import 'package:app/core/constant/Colors.dart';
import 'package:app/core/constant/approute.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../core/constant/imageassets.dart';
import '../../../core/function/mediaqueryfun.dart';
import '../../widgets/cutomformfaild.dart';

class LogIn extends StatelessWidget {
  LogIn({Key? key}) : super(key: key);
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: SingleChildScrollView(
        child: SafeArea(
          child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  Text("Welcome Login",
                      style: TextStyle(
                          fontSize: mediaQuereyFun(size.width, 6, 0),
                          fontWeight: FontWeight.bold)),
                  Image.asset(AppImageAssets.logInImage, fit: BoxFit.fill),
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
                      print(formKey.currentState!.validate());
                      var formdata = formKey.currentState;
                      if (isConnected) {
                        if (formdata!.validate()) {
                          try {
                            final userCredential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: email.text,
                              password: password.text,
                            )
                                .then((value) {
                              Navigator.of(context)
                                  .pushReplacementNamed(AppRoute.homepage);
                            }).catchError((onError) {
                              print(onError.toString());
                              // ignore: avoid_single_cascade_in_expression_statements
                              AwesomeDialog(
                                context: context,
                                keyboardAware: true,
                                dismissOnBackKeyPress: false,
                                dialogType: DialogType.warning,
                                animType: AnimType.bottomSlide,
                                title: 'Error LogIn',
                                // padding: const EdgeInsets.all(5.0),
                                desc: '${onError.toString()}',
                                btnOkOnPress: () {},
                              )..show();
                            });
                            print(userCredential.user!.uid.isEmpty);

                            //return _mapFirebaseUser(userCredential.user);
                          } catch (e) {}
                        }
                      } else {
                        print("connection Error");
                      }
                    },
                    child: Text(
                      "LogIn",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: mediaQuereyFun(size.width, 5, 0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("If You do not have Acount Click"),
                      MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRoute.signin);
                        },
                        child: const Text("here",
                            style: TextStyle(
                                color: AppColor.blueAccent,
                                decoration: TextDecoration.underline)),
                      )
                    ],
                  ),
                  const Center(
                    child: Text("Or"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      FloatingActionButton(
                        heroTag: null,
                        backgroundColor: Colors.white,
                        onPressed: () async {
                          UserCredential usercredential =
                              await signInWithGoogle();
                        },
                        child: const CircleAvatar(
                          backgroundImage: AssetImage(
                            AppImageAssets.google,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      FloatingActionButton(
                        heroTag: null,
                        backgroundColor: Colors.white,
                        onPressed: () {},
                        child: const CircleAvatar(
                          backgroundImage: AssetImage(
                            AppImageAssets.facebook,
                          ),
                        ),
                      )
                    ],
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

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
