import 'package:medical/model/service.dart';

class User {
  final String id;
  final List<Service> service;

  User({
    required this.id,
    required this.service,
  });

  factory User.fromMap(Map<String, dynamic> user) {
    return User(
      id: user['id'],
      service: (user['services'] as List<dynamic>)
          .map((service) => Service.fromJson(service))
          .toList(),
    );
  }
}
