import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<String> readData(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String value = prefs.getString(key) ?? '';
  return value;
}

Future<void> saveData(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

Future<void> saveIntData(String key, int value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt(key, value);
}

class AuthServices {
  String endpoint = 'http://localhost:8000/login';

  Future<bool> login({required String email, required String password}) async {
    http.Response response = await http.post(
      Uri.parse(endpoint),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      String accessToken = jsonDecode(response.body)['token'];
      int id = jsonDecode(response.body)['userId'];
      saveData("accessToken", accessToken);
      saveIntData("userId", id);
      return true;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final authServiceProvider = Provider<AuthServices>((ref) => AuthServices());
