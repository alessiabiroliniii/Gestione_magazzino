import 'package:flutter/material.dart';
import 'package:warehouse_app/utility.dart';
import 'package:warehouse_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  String? token;

  void _setToken(String? newToken) {
    if (token != newToken) {
      token = newToken;
      notifyListeners();
    }
  }

  Future<void> init() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    String? tempToken = sp.getString(Utility.sharedPreferencesToken);

    if (tempToken != null) {
      _setToken(tempToken);
    }
  }

  Future<void> logout() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.remove(Utility.sharedPreferencesToken);

    _setToken(null);
  }

  Future<void> login(UserLoginDTO user) async {
    _setToken("Token");

    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString(
      Utility.sharedPreferencesToken,
      "Token",
    );
  }

  Future<void> register(UserRegisterDTO user) async {
    _setToken("Token");

    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString(
      Utility.sharedPreferencesToken,
      "Token",
    );
  }
}
