import 'package:appdanhgia/model/service.dart';

class User {
  final String name;
  final String id;
  final List<Service> service;
  final String time;

  User({
    required this.name,
    required this.id,
    required this.service,
    required this.time,
  });

  factory User.fromMap(Map<String, dynamic> user) {
    return User(
      name: user['name'],
      id: user['id'],
      time: user['time'],
      service: (user['services'] as List<dynamic>)
          .map((service) => Service.fromJson(service))
          .toList(),
    );
  }
}
