// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:codex_meet/Provider/ProfileProvider.dart';
import 'package:codex_meet/api/ApiRequest.dart';
import 'package:codex_meet/components/inputbox/InputBox.dart';
import 'package:codex_meet/manager/Storage/Storage.dart';
import 'package:codex_meet/manager/routes/AppRoutes.gr.dart';
import 'package:codex_meet/manager/snackbar/viewSnackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode emailFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();
  bool hidePass = true;
  bool isLoading = false;

  GlobalKey<FormState> formKeyValidaror = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  UseLocalStorage storage = UseLocalStorage(storage: localStorage);
  loginUser() async {
    try {
      setState(() {
        isLoading = true;
      });
      ApiRequest loginRequest = ApiRequest(
        path: "/api/auth/login",
        method: "POST",
        body: {"email": emailController.text, "pass": passController.text},
      );
      Response response = await loginRequest.send();
      Map data = response.data;

      if (data.containsKey("error")) {
        ViewSnackBar(context, text: data['error'], backgroundColor: Colors.red);
      } else {
        storage.setStorage(key: "authKey", data: data['token']);
        Provider.of<ProfileProvider>(context, listen: false)
            .setData(data['data']);
        AutoRouter.of(context)
            .pushAndPopUntil(const HomeRoute(), predicate: (_) => false);
      }
      setState(() {
        isLoading = false;
      });
    } on SocketException {
      ViewSnackBar(context,
          text: "Check Your Internet", backgroundColor: Colors.red);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      if (kDebugMode) {
        print(e);
      }
      ViewSnackBar(context, text: "Unknown Error", backgroundColor: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Image.asset(
                  "assets/team.png",
                  width: 280,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Hello Again!",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 200,
              child: const Text(
                "Welcome Back You Have been Missed!",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Form(
              key: formKeyValidaror,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  InputBox(
                    hintText: "Email ID",
                    focusNode: emailFocusNode,
                    controller: emailController,
                    validator: (str) {
                      if (str!.isEmpty) {
                        return "Please Enter Your Email ID";
                      }
                      if (!InputBox.validateEmail(str)) {
                        return "Invalid Email ID";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  InputBox(
                    hintText: "Password",
                    focusNode: passFocusNode,
                    obscureText: hidePass,
                    controller: passController,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          hidePass = !hidePass;
                        });
                      },
                      child: Icon(
                        hidePass
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined,
                        size: 18,
                      ),
                    ),
                    validator: (str) {
                      if (str!.split(" ").join().isEmpty) {
                        return "Please Enter Your Password";
                      } else if (str.split(" ").join().length <= 5) {
                        return "Your Password is Too Short";
                      }
                      return null;
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          AutoRouter.of(context).pushNamed("/forgotpassword");
                        },
                        child: Text(
                          "Forgot Passsword?",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 58,
              child: ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () {
                        if (formKeyValidaror.currentState!.validate()) {
                          loginUser();
                        }
                      },
                child: Builder(builder: (context) {
                  if (isLoading) {
                    return CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    );
                  }
                  return const Text(
                    "Login",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  );
                }),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Don`t Have Any Account",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    AutoRouter.of(context).pushNamed("/signup");
                  },
                  child: const Text(
                    "SignUp Now",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ]),
        ),
      ),
    );
  }
}
