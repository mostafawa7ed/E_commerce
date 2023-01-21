import 'package:app/core/constant/Colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constant/imageassets.dart';
import '../../../core/function/mediaqueryfun.dart';
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
                  Image.asset(AppImageAssets.logInImage, fit: BoxFit.fill),
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
                      print(_form_state.currentState!.validate());
                      var formdata = _form_state.currentState;
                      if (formdata!.validate()) {
                        try {
                          UserCredential credential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                            email: email.text,
                            password: password.text,
                          );
                          awesomeshow(context);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }
                      } else {
                        print("valid");
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
