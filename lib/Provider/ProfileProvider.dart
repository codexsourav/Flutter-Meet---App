import 'package:codex_meet/api/ApiRequest.dart';
import 'package:flutter/foundation.dart';

class ProfileProvider extends ChangeNotifier {
  Map _profile = {};
  List _meets = [];

  List get meets => _meets;
  Map get profile => _profile;

  setData(Map data) {
    _profile = data['profile'];
    _meets = data['meets'];
    notifyListeners();
  }

  newMeet(code) async {
    _meets.add({
      "meetId": code,
      "creatorEmail": profile['email'],
      "date": DateTime.now().toIso8601String(),
    });
    notifyListeners();

    try {
      await ApiRequest(path: "/api/meet/$code", method: "POST").send();
    } catch (e) {
      print(e);
    }
  }

  tmpNewMeet(meet) async {
    if (meets.where((element) => element["meetId"] == meet['meetId']).isEmpty) {
      _meets.add(meet);
      notifyListeners();
    }
  }

  removeMeet(code) async {
    Map meet = meets.where((element) => element["meetId"] == code).toList()[0];
    _meets.removeWhere((element) => element['meetId'] == code);
    notifyListeners();
    if (meet['creatorEmail'] == profile['email']) {
      try {
        await ApiRequest(path: "/api/meet/$code", method: "DELETE").send();
      } catch (e) {
        print(e);
      }
    }
  }
}
