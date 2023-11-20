import 'package:auto_route/auto_route.dart';
import 'package:codex_meet/Provider/ProfileProvider.dart';
import 'package:codex_meet/utiles/ShareLink.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

showActionsMeet(context, {required code}) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.white,
    elevation: 0.0,
    builder: (BuildContext context) {
      ProfileProvider profileProvider =
          Provider.of<ProfileProvider>(context, listen: false);
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 60,
              height: 8,
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 190, 190, 190),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      AutoRouter.of(context).pop();
                      AutoRouter.of(context).pushNamed("/joinmeet/${code}");
                    },
                    dense: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    tileColor: Color.fromARGB(255, 255, 255, 255),
                    leading: Icon(Icons.meeting_room_rounded),
                    title: Text("Join Meet"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  ListTile(
                    onTap: () {
                      AutoRouter.of(context).pop();
                      copyMeetLink(code);
                    },
                    dense: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    tileColor: Color.fromARGB(255, 255, 255, 255),
                    leading: Icon(Icons.copy),
                    title: Text("Copy Code"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  ListTile(
                    onTap: () {
                      AutoRouter.of(context).pop();
                      sherelink(code);
                    },
                    dense: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    tileColor: Color.fromARGB(255, 255, 255, 255),
                    leading: Icon(Icons.share),
                    title: Text("Share Link"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  ListTile(
                    onTap: () {
                      AutoRouter.of(context).pop();
                      profileProvider.removeMeet(code);
                    },
                    dense: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    tileColor: Color.fromARGB(255, 255, 255, 255),
                    leading: Icon(Icons.delete),
                    title: Text("Delete Meet"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}
