// ignore: file_names
import 'dart:io';

import 'package:codex_meet/manager/Storage/Storage.dart';
import 'package:dio/dio.dart' as dio;

class ApiRequest {
  final String method;
  final String path;
  final dynamic body;
  final String endPoint;

  ApiRequest({
    this.method = "GET",
    this.path = "/",
    this.body,
    this.endPoint = "https://codexmeet.onrender.com",
  });

  Future<dio.Response> send() async {
    try {
      dio.Dio useDio = dio.Dio();
      UseLocalStorage storage = UseLocalStorage(storage: localStorage);
      String? jwtToken = await storage.getStorage(key: "authKey");
      dio.Response response = await useDio.request(
        "$endPoint$path",
        options: dio.Options(
          method: method,
          headers: {"Authorization": "barer $jwtToken"},
        ),
        data: body,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on dio.DioException catch (e) {
      if (e.response != null || e.response!.statusCode == 401) {
        await UseLocalStorage(storage: localStorage).cleanStorage();
      }
      rethrow;
    }
  }
}
