import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lingkar_budaya/common/Core/constants.dart';
import 'package:lingkar_budaya/common/data/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  Future<User> register(User body) async {
    var url = Uri.parse('$baseURL/users');
    var header = {'Content-Type': 'application/json'};
    var request = jsonEncode({
      'name': body.name,
      'username': body.username,
      'email': body.email,
      'password': body.password
    });

    var response = await http.post(url, headers: header, body: request);
    print(request);
    print(response.statusCode);

    var jsonData = jsonDecode(response.body);
    User userData = User.fromJson(jsonData['data']);
    print('JSON DATA');
    print(jsonData);
    print('REGISTER RESPONSE');
    print(userData);

    return userData;
  }

  Future<User> getUserData(String username) async {
    var response = await http.get(Uri.parse('$baseURL/users/$username'));
    var jsonData = jsonDecode(response.body);

    User user = User.fromJson(jsonData['data']);
    return user;
  }

  Future<void> editUser(int id, {String? name, String? password}) async {
    var url = Uri.parse('$baseURL/users/$id');
    var header = {'Content-Type': 'application/json'};
    var request = jsonEncode({
      'name': name,
      'password': password,
    });

    await http.put(url, headers: header, body: request);
  }

  Future<void> storeLocalUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = json.encode(user.toJson());
    print(userJson);
    prefs.setString('user', userJson);
  }

  Future<void> updateLocalUser(User updatedUser) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');

    if (userJson != null) {
      User existingUser = User.fromJson(json.decode(userJson));

      if (updatedUser.name != null) {
        existingUser.name = updatedUser.name;
      }

      if (updatedUser.password != null) {
        existingUser.password = updatedUser.password;
      }
      String updatedUserJson = json.encode(existingUser.toJson());

      prefs.setString('user', updatedUserJson);
    }
  }

  Future<User?> getLocalUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? personJson = prefs.getString('user');
    if (personJson != null) {
      Map<String, dynamic> json = jsonDecode(personJson);
      print(json);
      return User.fromJson(json);
    }
    return null;
  }

  Future<void> deleteLocalUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
  }
}
