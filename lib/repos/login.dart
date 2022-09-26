import 'dart:convert';
import 'package:wiki_app/utilities/http_wrapper.dart';

import '../models/req_model.dart';
import '../models/respons_model.dart';
import '../utilities/constants.dart';

class Login {
  Future<Response> loginn(LoginReqModel requestModel) async {
    try {
      final response = await HttpWrapper().post(
          Constants.KapiUrl + Constants.KloginEndPoint,
          body: requestModel.toJson());
      return Response.fromJson(
        json.decode(response),
      );
    } catch (e) {
      print(e);
      throw Exception('Error Has Happened while getting data');
    }
  }
}
