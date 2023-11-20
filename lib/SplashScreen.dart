// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:codex_meet/Provider/ProfileProvider.dart';
import 'package:codex_meet/api/ApiRequest.dart';
import 'package:codex_meet/manager/Storage/Storage.dart';
import 'package:codex_meet/manager/Theme/LightTheme.dart';
import 'package:codex_meet/manager/routes/AppRoutes.gr.dart';
import 'package:codex_meet/manager/snackbar/viewSnackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:uni_links/uni_links.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  tryNavigate() async {
    try {
      if (Platform.isAndroid) {
        try {
          final initialLink = await getInitialLink();
          if (initialLink != null) {
            Uri url = Uri.parse(initialLink.toString());
            await AutoRouter.of(context).replaceNamed(url.path);
          } else {
            await AutoRouter.of(context)
                .pushAndPopUntil(const HomeRoute(), predicate: (_) => false);
          }
        } catch (e) {
          await AutoRouter.of(context)
              .pushAndPopUntil(const HomeRoute(), predicate: (_) => false);
        }
      } else {
        await AutoRouter.of(context)
            .pushAndPopUntil(const HomeRoute(), predicate: (_) => false);
      }
    } catch (e) {
      await AutoRouter.of(context)
          .pushAndPopUntil(const HomeRoute(), predicate: (_) => false);
    }
  }

  Future getUserProfile() async {
    try {
      Response response = await ApiRequest(
        path: "/api/profile",
        method: "GET",
      ).send();

      Map data = response.data;
      if (data.containsKey("auth") || data['auth'] == false) {
        await tryNavigate();
      } else {
        Provider.of<ProfileProvider>(context, listen: false).setData(data);
        await tryNavigate();
      }
    } on SocketException {
      ViewSnackBar(
        context,
        text: "Check Your Internet",
        showCloseIcon: false,
        backgroundColor: Colors.red,
      );
    } on DioException catch (e) {
      print(e.error);
      print(e.message);

      if (e.response != null || e.response!.statusCode == 401) {
        await AutoRouter.of(context)
            .pushAndPopUntil(const LoginRoute(), predicate: (_) => false);
      } else {
        ViewSnackBar(
          context,
          text: "Check Your Internet",
          showCloseIcon: false,
          backgroundColor: Colors.red,
        );
      }
    }
  }

  @override
  void initState() {
    localStorage.ready.then((value) {
      Timer(const Duration(seconds: 2), () async {
        UseLocalStorage storage = UseLocalStorage(storage: localStorage);
        var data = await storage.getStorage(key: "authKey");

        if (data == null || data.isEmpty) {
          await tryNavigate();
        } else {
          await getUserProfile();
        }
      });
    }).catchError((e) async {
      await tryNavigate();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Lottie.asset(
              "assets/call.json",
              repeat: false,
              width: 280,
            ),
            const Text(
              "CodeX Meet",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text("Connecting Minds, Anytime, Anywhere"),
            const Spacer(),
            SizedBox(
              width: 100,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(kappcolor),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
