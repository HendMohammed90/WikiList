import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class CacheWrapper {
  Future<bool> setUserData(String userData) async {
    try {
      // Obtain shared preferences.
      final prefs = await SharedPreferences.getInstance();
      // Save an String value to 'action' key.
      await prefs.setString(Constants.USER_DATA_KEY, userData);
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<String?> getUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? userData = prefs.getString(Constants.USER_DATA_KEY);
      return userData;
    } catch (error) {
      print(error);
      return 'Error in getting user Data';
    }
  }
}
