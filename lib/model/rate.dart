import 'package:medical/model/comment.dart';

class Rate {
 final int id;
  // final List<Comments> service;

  Rate({
    required this.id,
    // required this.service,
  });

  factory Rate.fromMap(Map<String, dynamic> user) {
    return Rate(
      id: user['rate']['selectedEmoji'],
      // service: (user['services'] as List<dynamic>)
      //     .map((service) => Rate.fromJson(service))
      //     .toList(),
    );
  }
}