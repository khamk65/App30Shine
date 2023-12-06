import 'package:flutter/material.dart';
import 'package:medical/model/service.dart';

import '../model/user.dart';
import '../services/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];
  late List<dynamic> data;

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rest API Call"),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final id = user.id;
          final services = user.service;

          // Tạo một danh sách các Widget ListTile từ danh sách services
          List<Widget> serviceListTiles = services
              .map((service) => ListTile(
                    title: Text(service.name),
                    subtitle: Text('Price: ${service.price}'),
                  ))
              .toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(id),
                subtitle: Text(''),
              ),
              // Hiển thị danh sách các dịch vụ
              ...serviceListTiles,
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
        hoverColor: Colors.black,
      ),
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}
