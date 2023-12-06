class Service {
 final String name;
  final int price;

  Service({required this.name, required this.price});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      name: json['name'],
      price: json['price'],
    );
  }
}
