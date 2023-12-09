import 'package:flutter/material.dart';

class EndScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Lời Cảm Ơn'),
      // ),
      body: Container(
        decoration: new BoxDecoration(
          color: Color.fromARGB(255, 149, 236, 240),
          gradient: new LinearGradient(
              colors: [Color.fromARGB(255, 149, 233, 237), Colors.cyan],
              begin: Alignment.centerRight,
              end: new Alignment(-1.0, -1.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Chúng tôi trân trọng sự tin tưởng và ủng hộ của bạn. Cảm ơn bạn đã là khách hàng của chúng tôi!',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(style: ButtonStyle( backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            // Xác định màu sắc dựa trên trạng thái của nút
            if (states.contains(MaterialState.pressed)) {
              // Trạng thái khi nút được nhấn
              return Colors.red;
            } else {
              // Trạng thái mặc 
              return Color.fromRGBO(47, 179, 178, 0.8);
            }})),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Quay Lại',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
