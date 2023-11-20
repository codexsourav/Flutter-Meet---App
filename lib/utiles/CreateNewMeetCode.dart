import 'dart:math';

String newMeetCode() {
  // Generate a random string of characters
  String randomString() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    const length = 4;
    final random = Random();

    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(random.nextInt(chars.length)),
      ),
    );
  }

  // Generate the unique ID in the specified format
  final uniqueId =
      '${randomString()}-${randomString()}-${randomString()}-${randomString()}';

  return uniqueId;
}
