// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:codex_meet/Provider/ProfileProvider.dart';
import 'package:codex_meet/manager/Storage/Storage.dart';
import 'package:codex_meet/manager/Theme/LightTheme.dart';
import 'package:codex_meet/manager/routes/AppRoutes.gr.dart';
import 'package:codex_meet/utiles/ActionBottamSheet.dart';
import 'package:codex_meet/utiles/CreateNewMeetCode.dart';
import 'package:codex_meet/utiles/LaunchUrl.dart';
import 'package:codex_meet/utiles/NewMeetAlert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UseLocalStorage storage = UseLocalStorage(storage: localStorage);
  late ProfileProvider profileProvider;

  @override
  void initState() {
    profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Meet",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          String meetCode = newMeetCode();
                          profileProvider.newMeet(meetCode);
                          showNewMeetAlertDialog(
                            context,
                            keytext: meetCode,
                          );
                        },
                        child: const Text("New Meeting"),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () {
                          AutoRouter.of(context).pushNamed("/joinbycode");
                        },
                        child: const Text("Join Meeting"),
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 5, bottom: 10),
                child: Text(
                  "MEETINGS",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Consumer<ProfileProvider>(
                builder: (context, value, child) {
                  List meets = value.meets.reversed.toList();
                  return ListView.builder(
                    itemCount: meets.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      Map data = meets[index];
                      return Dismissible(
                        key: UniqueKey(),
                        background: Container(
                          color: Colors.red,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 30),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        direction: DismissDirection.endToStart,
                        onDismissed: (key) {
                          value.removeMeet(data['meetId']);
                        },
                        child: ListTile(
                          onLongPress: () =>
                              showActionsMeet(context, code: data['meetId']),
                          leading: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 241, 241, 241),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.video_camera_front_rounded,
                                color: Color.fromARGB(255, 108, 99, 255),
                                size: 19,
                              ),
                            ),
                          ),
                          title: Text(
                            data['meetId'],
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          trailing: Container(
                            margin: const EdgeInsets.symmetric(vertical: 12),
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(176, 107, 99, 255)),
                              ),
                              onPressed: () {
                                AutoRouter.of(context)
                                    .pushNamed("/joinmeet/${data['meetId']}");
                              },
                              child: const Text("JOIN"),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              )
            ]),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        elevation: 0,
        child: Column(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                currentAccountPictureSize: const Size.square(60),
                currentAccountPicture: CircleAvatar(
                  child: Text(
                    profileProvider.profile['name'][0].toString().toUpperCase(),
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                accountName: Text(profileProvider.profile['name']),
                accountEmail: Text(profileProvider.profile['email']),
              ),
            ),
            ListView(
              padding: const EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                ListTile(
                  onTap: () {
                    AutoRouter.of(context).pushNamed("/joinbycode");
                  },
                  leading: Icon(
                    Icons.meeting_room_rounded,
                    color: kappcolor,
                  ),
                  title: const Text(
                    "Join Meet",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Launch.url(
                      Uri.parse(
                        "https://play.google.com/store/apps/dev?id=7846146618868740188",
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.streetview_rounded,
                    color: kappcolor,
                  ),
                  title: const Text(
                    "More Apps",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                  ),
                ),
                ListTile(
                  onTap: () async {
                    await storage.cleanStorage();
                    AutoRouter.of(context)
                        .pushAndPopUntil(LoginRoute(), predicate: (_) => false);
                  },
                  leading: Icon(
                    Icons.exit_to_app_rounded,
                    color: kappcolor,
                  ),
                  title: const Text(
                    "Logout",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                )
              ],
            )
          ],
        ),
      ), //Drawer,
    );
  }
}
