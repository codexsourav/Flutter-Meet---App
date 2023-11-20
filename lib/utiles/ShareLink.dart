import 'package:clipboard/clipboard.dart';
import 'package:share_plus/share_plus.dart';

sherelink(keytext) {
  Share.share("""To join the meeting on Codex Meet, click this link: 
  https://codexmeet.onrender.com/joinmeet/$keytext
  
  Or open Meet and enter this code: $keytext
  """);
}

copyMeetLink(keytext) {
  FlutterClipboard.copy(keytext).then((value) => print('copied'));
}
