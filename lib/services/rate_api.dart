import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/rate.dart';


class RateApi {
  static Future<List<Rate>> fetchRate() async {
    print('fetchUsers called');
    const url =
        'https://api.mockfly.dev/mocks/a909ef21-b26b-4c6e-a14f-cc724b00d162/rate';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final rates = results.map((user) {
      return Rate.fromMap(user);
    }).toList();
    print("fetchUsers completed");
    return rates;
  }
}