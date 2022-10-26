import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wiki_app/utilities/constants.dart';
import 'package:wiki_app/utilities/http_wrapper.dart';
import '../models/user.dart';
import '../utilities/cache_wrapper.dart';

class Users {
  Future<List<Data>> getUsers() async {
    try {
      String? cachedUserData = await CacheWrapper().getUserData();
      Map<String, String> headers = {};
      if (cachedUserData != null) {
        Map<String, dynamic> cachedUserDataJson = jsonDecode(cachedUserData);
        if (cachedUserDataJson['data'] != null &&
            cachedUserDataJson['data']['Token'] != null) {
          headers['Authorization'] =
              "Bearer ${cachedUserDataJson['data']['Token']}";
        }
      }
      String response = await HttpWrapper()
          .get(Constants.KapiUrl + Constants.KuserEndpoint, headers: headers);
      Map result = jsonDecode(response);
      // print(result);
      Iterable userItrerble = result['data'];
      // print(userItrerble);
      List<Data> usersList =
          userItrerble.map((singleItem) => Data.fromJson(singleItem)).toList();
      print(userItrerble);
      return usersList;
    } catch (e) {
      print(e);
      throw Exception(
          'Error Has Happened while getting data 22222 from getuser');
    }
  }
}
