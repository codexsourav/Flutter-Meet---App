import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:codex_meet/Provider/ProfileProvider.dart';
import 'package:codex_meet/api/ApiRequest.dart';
import 'package:codex_meet/components/inputbox/InputBox.dart';
import 'package:codex_meet/manager/Storage/Storage.dart';
import 'package:codex_meet/manager/routes/AppRoutes.gr.dart';
import 'package:codex_meet/manager/snackbar/viewSnackbar.dart';
import 'package:codex_meet/utiles/Navigation.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool hidePass = true;
  bool isLoading = false;
  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();
  GlobalKey<FormState> formKeyValidaror = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  UseLocalStorage storage = UseLocalStorage(storage: localStorage);

  Future makeNewAccount() async {
    Map userData = {
      "name": nameController.text,
      "email": emailController.text,
      "pass": passController.text,
    };

    ApiRequest signupRequest = ApiRequest(
      body: userData,
      method: "POST",
      path: "/api/auth/signup",
    );

    try {
      setState(() {
        isLoading = true;
      });
      Response response = await signupRequest.send();
      Map data = response.data;
      print(data);
      if (data.containsKey("error")) {
        ViewSnackBar(
          context,
          text: data['error'],
          backgroundColor: Colors.red,
        );
      } else {
        storage.setStorage(key: "authKey", data: data['token']);
        Provider.of<ProfileProvider>(context, listen: false)
            .setData(data['data']);
        await AutoRouter.of(context)
            .pushAndPopUntil(HomeRoute(), predicate: (_) => false);
      }
      setState(() {
        isLoading = false;
      });
    } on SocketException catch (err) {
      ViewSnackBar(
        context,
        text: "Please Check Your Internet!",
        backgroundColor: Colors.red,
      );
    } on DioException catch (e) {
      print(e.error);
      print(e.response!.statusCode);
      ViewSnackBar(
        context,
        text: "Some Unknown Error!",
        backgroundColor: Colors.red,
      );
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Create New Account",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          onPressed: () {
            Navigation.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(children: [
            const SizedBox(height: 20),
            Form(
              key: formKeyValidaror,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  InputBox(
                    hintText: "Name",
                    focusNode: nameFocusNode,
                    controller: nameController,
                    autofocus: true,
                    validator: (str) {
                      if (str!.split(" ").join().isEmpty) {
                        return "Please Enter Your Name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 20),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 58,
              child: ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () async {
                        if (formKeyValidaror.currentState!.validate()) {
                          makeNewAccount();
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
                    "Sign up",
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
                  "Already Have a Account",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.back();
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
