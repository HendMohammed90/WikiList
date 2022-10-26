import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wiki_app/utilities/http_wrapper.dart';
import '../models/req_model.dart';
import '../models/response.dart';
import '../utilities/cache_wrapper.dart';
import '../utilities/constants.dart';

class Login {
  Future<dynamic> loginn(LoginReqModel requestModel) async {
    try {
      final response = await HttpWrapper().post(
        Constants.KapiUrl + Constants.Kauthinticat + Constants.KloginEndPoint,
        body: requestModel.toJson(),
      );
      // print(response);
      final jsonResponse = jsonDecode(response);
      var result = LoginModel.fromJson(jsonResponse);
      // print(jsonResponse); /////////
      // print(result);
      if (result.code == 1) {
        print('we have fail');
        print(result.message);
      } else {
        print('we have success');
        // var token = result.data!.token;
        // bool? cachedUserData = await CacheWrapper().setUserData(response);
        // print(cachedUserData);
        return result;
      }
    } catch (e) {
      print(e);
      throw Exception('Error Has Happened while getting data 1111from login');
    }
  }
}
