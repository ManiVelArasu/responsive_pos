import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_design/data_services/response_handler.dart';
import 'api_type_enum.dart';


class ApiHelper {

  downloadFile(String baseUrl, String path, var body,) async {
    final uri = Uri.https(baseUrl, path, {});
    var header = {
      "Authorization": "Bearer",
    };
    final response = await http.post(uri, headers: header, body: body);
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      return response.body;
    }
  }


  Future<dynamic> multiMethod(String baseurl, String path,
      {Map<String, dynamic>? body,
        Map<String, String>? params,
        Map<String, String>? headers,
        int type = 1,
        ApiTypeEnum methodType = ApiTypeEnum.post,
        bool isRefresh = false}) async {
    dynamic responseJson;
    Map<String, String> baseheader = {};
    Map<String, String> finalparams = {};
    if (params != null) {
      finalparams.addAll(params);
    }
    final uri = Uri.https(baseurl, path, finalparams);
    if (headers != null) {
      baseheader.addAll(headers);
    }
    if (type == 2) {
      baseheader.addAll({
        "Authorization":
        "Bearer",
      });
    }
    baseheader.addAll({'content-type': 'application/json'});

    try {
      final response = await buildBase(
        uri,
        body: jsonEncode(body),
        headers: baseheader,
        type: methodType,
      );
      //    print(response.request);
      responseJson = ResponseHandler(response);
    } on SocketException {
      throw const SocketException('No Internet connection');
    } catch (e) {
      rethrow;
    }
    return responseJson;
  }

  Future<dynamic> multiPart(
      String baseurl,
      String path, {
        Map<String, String>? body,
        Map<String, String>? params,
        Map<String, String>? headers,
        Map<String, dynamic>? files,
        List<dynamic>? fileLists,
        String? key,
        int type = 2,
        ApiTypeEnum methodtype = ApiTypeEnum.post,
      }) async {
    dynamic responseJson;
    Map<String, String> baseheader = {};
    final uri = Uri.https(baseurl, path);
    var request = http.MultipartRequest(methodtype.name, uri);

    if (type == 2) {
      baseheader.addAll({
        "Authorization": "Bearer",
        'Content-Type': 'multipart/form-data;'
      });
    }

    if (headers != null) {
      baseheader.addAll(headers);
    }
    if (body != null) {
      body.forEach((key, value) {
        request.fields[key] = value;
      });
    }
    if (files != null) {
      files.forEach((key, value) async {
        List mapnew = files[key];
        for (var element in mapnew) {
          try {
            request.files.add(await http.MultipartFile.fromPath(key, element));
          } catch (e) {
            if (kDebugMode) {
              print(e);
            }
          }
        }
      });
    }
    ///List of files with same key word
    if(fileLists!=null&&key!=null){
      for (int i = 0; i < fileLists.length; i++) {
        try {
          request.files
              .add(await http.MultipartFile.fromPath(key, fileLists[i]));
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
        }

      }
    }


    request.headers.addAll(baseheader);
    try {
      //     print(baseheader);
      http.StreamedResponse response = await request.send();
      //  print(await response.stream.bytesToString());

      http.Response res = http.Response(
          await response.stream.bytesToString(), response.statusCode);
      responseJson = ResponseHandler(res);
    } on SocketException {
      throw const SocketException('No Internet connection');
    } catch (e) {
      rethrow;
    }

    return responseJson;
  }

  buildBase(Uri uri,
      {required String body,
        required Map<String, String> headers,
        ApiTypeEnum type = ApiTypeEnum.post}) {
    // print(headers);
    switch (type) {
      case ApiTypeEnum.get:
        return http.get(uri, headers: headers);
      case ApiTypeEnum.post:
        return http.post(uri, body: body, headers: headers);
      case ApiTypeEnum.put:
        return http.put(uri, body: body, headers: headers);
      case ApiTypeEnum.patch:
        return http.patch(uri, body: body, headers: headers);
      case ApiTypeEnum.delete:
        return http.delete(uri, body: body, headers: headers);
      default:
        return http.post(uri, body: body, headers: headers);
    }
  }
}
