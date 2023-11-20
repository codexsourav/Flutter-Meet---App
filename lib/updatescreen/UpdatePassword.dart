import 'package:auto_route/auto_route.dart';
import 'package:codex_meet/api/ApiRequest.dart';
import 'package:codex_meet/components/inputbox/InputBox.dart';
import 'package:codex_meet/manager/Storage/Storage.dart';
import 'package:codex_meet/manager/routes/AppRoutes.gr.dart';
import 'package:codex_meet/manager/snackbar/viewSnackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ResetPassword extends StatefulWidget {
  final String token;
  const ResetPassword(@PathParam('token') this.token, {super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool hidePass = true;
  bool isLoading = false;
  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();
  GlobalKey<FormState> formKeyValidaror = GlobalKey<FormState>();

  TextEditingController passController = TextEditingController();
  TextEditingController cpassController = TextEditingController();

  UseLocalStorage storage = UseLocalStorage(storage: localStorage);

  Future chengePass() async {
    setState(() {
      isLoading = true;
    });
    try {
      ApiRequest sendMail = ApiRequest(
          method: "PUT",
          path: "/api/auth/reset-password/${widget.token}",
          body: {
            "pass": passController.text,
          });
      Response response = await sendMail.send();
      Map data = response.data;
      if (data['status'] == true) {
        ViewSnackBar(context, text: data['message']);
        storage.cleanStorage();
        AutoRouter.of(context)
            .pushAndPopUntil(const LoginRoute(), predicate: (_) => false);
      } else {
        ViewSnackBar(context, text: data['error'], backgroundColor: Colors.red);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Reset Password",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          onPressed: () {
            storage.cleanStorage();
            AutoRouter.of(context)
                .pushAndPopUntil(const LoginRoute(), predicate: (_) => false);
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
            const SizedBox(height: 40),
            Form(
              key: formKeyValidaror,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  InputBox(
                    hintText: "Password",
                    focusNode: nameFocusNode,
                    controller: passController,
                    autofocus: true,
                    obscureText: hidePass,
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
                  InputBox(
                    hintText: "Confirm Password",
                    focusNode: passFocusNode,
                    obscureText: hidePass,
                    controller: cpassController,
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
                        return "Please Enter Confirm Password";
                      } else if (passController.text != cpassController.text) {
                        return "Password Not Matched";
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
                          chengePass();
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
                    "Change Password",
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
                    storage.cleanStorage();
                    AutoRouter.of(context).pushAndPopUntil(const LoginRoute(),
                        predicate: (_) => false);
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
