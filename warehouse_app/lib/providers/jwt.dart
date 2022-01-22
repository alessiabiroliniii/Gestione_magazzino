import 'package:warehouse_app/api_utility.dart';
import 'package:warehouse_app/models/user.dart';
import 'package:http/http.dart' as http;

class JwtProvider {
  String? token;
  String? refreshToken;

  /// get token and refresh token
  Future<void> login(UserLoginDTO user) async {
    final response = await http.post(
      Uri.https(ApiUtulity.apiConnection, ApiUtulity.login),
      body: user.toJson(),
    );

    if (response.statusCode == 200) {
      // return warehouse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("");
    }
  }

  /// refresh token and refresh token if token is expired
  Future<void> refreshExpiredToken() async {
    final response = await http.post(
      Uri.https(ApiUtulity.apiConnection, ApiUtulity.refreshToken),
      body: refreshToken,
    );

    if (response.statusCode == 200) {
      // return warehouse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("");
    }
  }

  Future<User> register(UserDTO user) async {
    final response = await http.post(
      Uri.https(ApiUtulity.apiConnection, ApiUtulity.register),
      body: user.toJson(),
    );

    if (response.statusCode == 200) {
      // return warehouse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("");
    }
  }
}
