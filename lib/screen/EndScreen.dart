import 'package:flutter/material.dart';

import '../aqiget.dart';

class EndScreen extends StatefulWidget {
  final ApiService apiService;

  EndScreen({Key? key, required this.apiService}) : super(key: key);

  @override
  _EndScreenState createState() => _EndScreenState();
}

class _EndScreenState extends State<EndScreen> {
  double amountToPay = 0.0;

  @override
  void initState() {
    super.initState();
    fetchServiceAmount();
  }

  Future<void> fetchServiceAmount() async {
    try {
      double amount = await widget.apiService.fetchServiceAmount();
      setState(() {
        amountToPay = amount;
      });
    } catch (e) {
      print('Error fetching data: $e');
      // Xử lý lỗi nếu cần
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          color: Color.fromRGBO(0, 0, 0, 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "MỜI ANH ",
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
              Text(
                "ĐÁNH GIÁ",
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromRGBO(222, 238, 5, 1),
                ),
              ),
              Text(
                " CHẤT LƯỢNG DỊCH VỤ",
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 140,
          child: Text("Cảm ơn anh đã sử dụng tại. Anh vui lòng thanh toán số tiền cho thu ngân: $amountToPay"),
        ),
        Container(
          child: Text(""), // Nội dung khác nếu cần
        ),
      ],
    );
  }
}
