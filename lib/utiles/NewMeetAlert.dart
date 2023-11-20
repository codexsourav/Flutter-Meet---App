import 'package:clipboard/clipboard.dart';
import 'package:codex_meet/utiles/ShareLink.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

showNewMeetAlertDialog(BuildContext context, {required String keytext}) {
  AlertDialog alert = AlertDialog(
    elevation: 0.0,
    actionsPadding: const EdgeInsets.all(0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    title: const Text(
      "Here's the link to your meeting",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
            "Copy this link and send it to people you want to meet with. Be sure to save it so you can use it later, to."),
        const SizedBox(height: 20),
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          minVerticalPadding: 0,
          tileColor: const Color.fromARGB(255, 236, 236, 236),
          dense: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "$keytext",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          trailing: IconButton(
              onPressed: () {
                copyMeetLink(keytext);
              },
              icon: const Icon(
                Icons.copy,
                size: 20,
              )),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            sherelink(keytext);
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.share,
                size: 15,
              ),
              SizedBox(width: 10),
              Text("Share Link"),
            ],
          ),
        ),
      ],
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
