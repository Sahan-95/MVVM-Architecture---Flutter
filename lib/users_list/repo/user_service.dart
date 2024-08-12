import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mvvm_pattern/users_list/repo/api_status.dart';
import 'package:mvvm_pattern/utils/constants.dart';

import '../models/model.dart';

class UserService {
  static Future<Object> getUsers() async {
    try {
      var url = Uri.parse(USER_LIST_URL);
      var response = await http.get(url);
      if (200 == response.statusCode) {
        return Success(code: 200, response: userModelFromJson(response.body));
      }
      return Failure(code: INVALID_RESPONSE, errorResponse: "Invaild Response");
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: "No Internet");
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: "Invalid Format");
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: "Unknownn Error");
    }
  }
}
