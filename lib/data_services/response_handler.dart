import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'app_exception.dart';

dynamic ResponseHandler(http.Response response) {

  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    case 400:
      var resJson = json.decode(response.body.toString());
      throw BadRequestException(resJson);
    case 401:

      ///token expired
      var resJson = json.decode(response.body.toString());

      throw TokenExpiredException(resJson);
    case 403:

      ///un authorized
      var resJson = json.decode(response.body.toString());
      throw UnauthorisedException(resJson);
    case 500:
      var resJson;
      try {
        resJson = json.decode(response.body.toString());
        throw InternalServerDataException(resJson);
      } catch (e) {
        throw InternalServerDataException(resJson);
      }

    default:
      throw FetchDataException(
          'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
