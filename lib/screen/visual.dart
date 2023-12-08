import 'package:flutter/material.dart';

import '../model/rate.dart';
import '../services/rate_api.dart';

class RateScreen extends StatefulWidget {
  const RateScreen({super.key});

  @override
  State<RateScreen> createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {
  List<Rate> rates = [];

  void initSate() {
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
        itemCount: rates.length,
        itemBuilder: (context, index) {
          final rate = rates[index];

          return ListTile(
            title: Text(rate.id.toString()),
            subtitle: Text(rate.comments.toString()),
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
    final response = await RateApi.fetchRate();
    setState(() {
      rates = response;
    });
  }
}
