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
}
