// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:codex_meet/api/ApiRequest.dart';
import 'package:codex_meet/components/inputbox/InputBox.dart';
import 'package:codex_meet/manager/snackbar/viewSnackbar.dart';
import 'package:codex_meet/utiles/Navigation.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ForgetPassword extends StatefulWidget {
  ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  sendResetLink() async {
    if (emailController.text.split(" ").join().isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      try {
        ApiRequest sendMail = ApiRequest(
          method: "POST",
          path: "/api/auth/reset-password/${emailController.text}",
        );
        Response response = await sendMail.send();
        Map data = response.data;
        if (data['status'] == true) {
          ViewSnackBar(context, text: data['message']);
          emailController.clear();
        } else {
          ViewSnackBar(context,
              text: data['error'], backgroundColor: Colors.red);
        }
        setState(() {
          isLoading = false;
        });
      } on DioException catch (e) {
        setState(() {
          isLoading = false;
        });
        if (e.response!.data != null) {
          ViewSnackBar(context,
              text: e.response!.data['error'], backgroundColor: Colors.red);
        } else {
          ViewSnackBar(context,
              text: 'Something Want Wrong', backgroundColor: Colors.red);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(35.0),
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 24, 24, 24)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                children: [
                  InputBox(
                    hintText: "Email Id",
                    autofocus: true,
                    controller: emailController,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    child: ElevatedButton(
                        onPressed: isLoading ? null : sendResetLink,
                        child: Builder(builder: (context) {
                          if (isLoading) {
                            return const CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            );
                          }
                          return const Text("Send Reset Password Link");
                        })),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
