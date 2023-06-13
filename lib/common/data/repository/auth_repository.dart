import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lingkar_budaya/common/Core/constants.dart';
import 'package:lingkar_budaya/common/data/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  Future<User> register(
      User body, Function()? onSuccess, Function()? onFailure) async {
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

    User userData = User();
    if (response.statusCode == 201) {
      onSuccess!();
      print(userData);
      return userData;
    } else {
      onFailure!();
      print(userData);
      return userData;
    }
  }

  Future<void> storeLocalUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = json.encode(user.toJson());
    print(userJson);
    prefs.setString('user', userJson);
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
