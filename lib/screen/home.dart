import 'package:appdanhgia/screen/endScreen.dart';
import 'package:flutter/material.dart';

import '../aqiget.dart';
import '../model/service.dart';
import '../model/use.dart';
import '../services/use_api.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Dịch vụ đã sử dụng")),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final id = user.id;
          final services = user.service;

          // Tạo danh sách các hàng của bảng
          List<TableRow> tableRows = [];

          // Tiêu đề của bảng
          tableRows.add(
            TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Tên'),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Giá'),
                  ),
                ),
              ],
            ),
          );

          // Dữ liệu dịch vụ
          for (Service service in services) {
            tableRows.add(
              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(service.name),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${service.price}'),
                    ),
                  ),
                ],
              ),
            );
          }

          // Tổng giá
          int total =
              services.map((service) => service.price).fold(0, (a, b) => a + b);
          tableRows.add(
            TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Tổng'),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('$total'),
                  ),
                ),
              ],
            ),
          );

          // Tạo bảng từ danh sách các hàng
          Widget serviceTable = Table(
            border: TableBorder.all(),
            children: tableRows,
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text("Tên khách hàng: $id"),
              ),
              // Hiển thị bảng dịch vụ
              serviceTable,
            ],
          );
        },
      ),
      floatingActionButton: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  EndScreen()));
            },
            child: Text(
              'Xác nhận đúng',
              style: TextStyle(),
            ),
          ),
        ),
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
