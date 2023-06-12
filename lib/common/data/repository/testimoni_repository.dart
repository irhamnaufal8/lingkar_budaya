import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lingkar_budaya/common/Core/constants.dart';
import 'package:lingkar_budaya/common/data/model/testimoni.dart';

class TestimoniRepository {
  Future<List<Testimoni>> getTestimoniList() async {
    var response = await http.get(Uri.parse('$baseURL/ratingStar'));
    var jsonData = jsonDecode(response.body);

    List<Testimoni> testimoniList = [];

    for (var testimoni in jsonData['data']) {
      final data = Testimoni(
        id: testimoni['id'],
        name: testimoni['name'],
        comment: testimoni['comment'],
        ratingStar: testimoni['ratingStar'],
      );
      testimoniList.add(data);
    }
    print(testimoniList);
    return testimoniList;
  }

  Future<void> createTestimoni(
      Testimoni body, Function()? onSuccess, Function()? onFailure) async {
    var url = Uri.parse('$baseURL/ratingStar');
    var header = {'Content-Type': 'application/json'};
    var request = jsonEncode({
      'name': body.name,
      'ratingStar': body.ratingStar,
      'comment': body.comment
    });

    var response = await http.post(url, headers: header, body: request);
    print(response.statusCode);

    if (response.statusCode == 200) {
      onSuccess!();
    } else {
      onFailure!();
    }
  }

  Future<void> editTestimoni(int id, Testimoni body, Function()? onSuccess,
      Function()? onFailure) async {
    var url = Uri.parse('$baseURL/ratingStar/$id');
    var header = {'Content-Type': 'application/json'};
    var request = jsonEncode({
      'name': body.name,
      'ratingStar': body.ratingStar,
      'comment': body.comment
    });

    var response = await http.put(url, headers: header, body: request);
    print(response.statusCode);

    if (response.statusCode == 200) {
      onSuccess!();
    } else {
      onFailure!();
    }
  }

  Future<void> deleteTestimoni(
      String id, Function()? onSuccess, Function()? onFailure) async {
    var url = Uri.parse('$baseURL/ratingStar/$id');
    var response = await http.delete(url);

    if (response.statusCode == 204) {
      onSuccess!();
    } else {
      onFailure!();
    }
  }
}
