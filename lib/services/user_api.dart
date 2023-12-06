import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/user.dart';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    print('fetchUsers called');
    const url = 'https://listview.free.beeceptor.com/todos';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((user) {
      return User.fromMap(user);
    }).toList();
    print("fetchUsers completed");
    return users;
  }
  
}
