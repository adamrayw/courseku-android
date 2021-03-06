// ignore_for_file: avoid_print, import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:courseku_mobile/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'http://courseku.herokuapp.com/api';

  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 201) {
      var data = jsonDecode(response.body)['user'];
      UserModel user = UserModel.fromJson(data);
      user.token = 'Bearer ' + jsonDecode(response.body)['token'];

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
