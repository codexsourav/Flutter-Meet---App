import 'package:flutter/foundation.dart';
import 'package:localstorage/localstorage.dart';

LocalStorage localStorage = LocalStorage('codexmeet');

class UseLocalStorage {
  final LocalStorage storage;
  UseLocalStorage({required this.storage});
  Future<bool> setStorage({required String key, dynamic data}) async {
    try {
      await storage.setItem(key, data);
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  Future<dynamic> getStorage({required String key}) async {
    try {
      dynamic data = await storage.getItem(key);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  bool deleteStorage({required String key}) {
    try {
      storage.deleteItem(key);
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  Future<bool> cleanStorage() async {
    try {
      await storage.clear();
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }
}
