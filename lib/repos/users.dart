import 'dart:convert';
import 'package:wiki_app/utilities/constants.dart';
import 'package:wiki_app/utilities/http_wrapper.dart';
import '../models/user.dart';

class Users {
  Future<List<User>> getUsers() async {
    try {
      String response =
          await HttpWrapper().get(Constants.KapiUrl + Constants.KuserEndpoint);
      Map result = jsonDecode(response);
      Iterable userItrerble = result['data'];
      List<User> usersList =
          userItrerble.map((jsonItem) => User.fromJson(jsonItem)).toList();
      return usersList;
    } catch (e) {
      print(e);
      throw Exception('Error Has Happened while getting data');
    }
  }
}
