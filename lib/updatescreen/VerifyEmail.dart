import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:codex_meet/api/ApiRequest.dart';
import 'package:codex_meet/manager/Theme/LightTheme.dart';
import 'package:codex_meet/manager/routes/AppRoutes.gr.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class VerifyEmail extends StatefulWidget {
  final String token;
  const VerifyEmail(@PathParam('token') this.token, {super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool isLoading = true;
  bool isVerified = false;

  verifyEmailProcess() async {
    try {
      setState(() {
        isLoading = true;
        isVerified = false;
      });
      ApiRequest apiRequest =
          ApiRequest(path: "/api/auth/verify/${widget.token}", method: "POST");
      Response response = await apiRequest.send();
      Map data = response.data;
      if (data['isEmailVerify'] == true) {
        isVerified = true;
      } else {
        isVerified = false;
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
        isVerified = false;
      });
    }
  }

  @override
  void initState() {
    verifyEmailProcess();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Visibility(
            visible: !isLoading,
            replacement: CircularProgressIndicator(
              color: kappcolor,
              backgroundColor: const Color.fromARGB(255, 241, 241, 241),
              strokeCap: StrokeCap.round,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 230,
                  height: 230,
                  child: Lottie.asset(
                    isVerified ? "assets/check.json" : "assets/error.json",
                    repeat: false,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  isVerified ? "Congratulations" : "Oh, HO",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    isVerified
                        ? "Your Email IS Successfully Verified"
                        : "Oops! Something went wrong on our end. Please try again later",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                    width: 120,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          if (isVerified) {
                            AutoRouter.of(context).pushAndPopUntil(HomeRoute(),
                                predicate: (_) => false);
                          } else {
                            verifyEmailProcess();
                          }
                        },
                        child: Text(
                          isVerified ? "Lets, GO" : "Retry",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )))
              ],
            )),
      ),
    );
  }
}
