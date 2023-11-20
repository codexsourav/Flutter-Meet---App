// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:codex_meet/Provider/ProfileProvider.dart';
import 'package:codex_meet/api/ApiRequest.dart';
import 'package:codex_meet/manager/routes/AppRoutes.gr.dart';
import 'package:codex_meet/manager/snackbar/viewSnackbar.dart';
import 'package:codex_meet/utiles/Navigation.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

@RoutePage()
class JoinMeet extends StatefulWidget {
  final String registerId;
  const JoinMeet(@PathParam('id') this.registerId, {super.key});

  @override
  State<JoinMeet> createState() => _JoinMeetState();
}

class _JoinMeetState extends State<JoinMeet> {
  getMeetInfo() async {
    ProfileProvider profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    Response response =
        await ApiRequest(path: "/api/meet/${widget.registerId}").send();

    if (response.data == null) {
      ViewSnackBar(
        context,
        text: "Meet Not Exist",
        backgroundColor: Colors.red,
      );
      Navigation.pop(context);
    } else {
      profileProvider.tmpNewMeet(response.data);
      // AutoRouter.of(context).pop();
      Navigation.pop(context);
      AutoRouter.of(context).push(MeetRoom(conferenceID: widget.registerId));
    }
  }

  @override
  void initState() {
    getMeetInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Joining Meet",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w200,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.registerId,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w200,
                color: Color.fromARGB(183, 255, 255, 255),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 1,
              strokeCap: StrokeCap.round,
            )
          ],
        ),
      ),
    );
  }
}
