import '../utilities/cache_wrapper.dart';
import '../utilities/http_wrapper.dart';
import 'dart:convert';

class Regester {
  Future<dynamic> userRegester(String data, body) async {
    try {
      String? cachedUserData = await CacheWrapper().getUserData();
      Map<String, String> headers = {};
      String response = await HttpWrapper().post(
          "http://restapi.adequateshop.com/api/authaccount/login",
          body: body);
      Map result = jsonDecode(response);
      print(result);
      // Iterable userItrerble = result['data'];
      // List<User> usersList =
      //     userItrerble.map((jsonItem) => User.fromJson(jsonItem)).toList();
      return result;
    } catch (error) {
      print(error);
      throw Exception('Error Has Happened while regestrition process ');
    }
  }
}
