import 'package:auto_route/auto_route.dart';
import 'package:codex_meet/Provider/ProfileProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

@RoutePage()
class MeetRoom extends StatelessWidget {
  final String conferenceID;

  const MeetRoom({
    Key? key,
    required this.conferenceID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileProvider profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    return SafeArea(
      child: ZegoUIKitPrebuiltVideoConference(
        appID: 315137917,
        appSign:
            "0c2604c85cb833584bbd3e65c666db2ac2924ad938e26f350e6e283964b9837b",
        userID: profileProvider.profile['email'],
        userName: profileProvider.profile['name'],
        conferenceID: conferenceID,
        config: ZegoUIKitPrebuiltVideoConferenceConfig(),
      ),
    );
  }
}
