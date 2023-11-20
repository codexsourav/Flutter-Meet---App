import 'package:auto_route/auto_route.dart';
import 'package:codex_meet/Provider/ProfileProvider.dart';
import 'package:codex_meet/components/inputbox/InputBox.dart';
import 'package:codex_meet/manager/routes/AppRoutes.gr.dart';
import 'package:codex_meet/utiles/Navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class JoinMeetWithCode extends StatelessWidget {
  JoinMeetWithCode({super.key});
  TextEditingController meetCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigation.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
          ),
        ),
        title: const Text(
          "Join Meet With Code",
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (meetCode.text.split(" ").join().isNotEmpty) {
                AutoRouter.of(context).pushNamed("/joinmeet/${meetCode.text}");
              }
            },
            child: const Text("Join"),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text("Enter the code provided by the meeting organizer"),
              ),
              InputBox(
                hintText: "Enter Meet Code",
                autofocus: true,
                controller: meetCode,
              ),
            ]),
      ),
    );
  }
}
