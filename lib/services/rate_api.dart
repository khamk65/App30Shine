import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/rate.dart';


class RateApi {
  static Future<List<Rate>> fetchRate() async {
    print('fetchUsers called');
    const url =
        'https://kham1.free.beeceptor.com/todos';
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