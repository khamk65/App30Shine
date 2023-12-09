// import 'dart:convert';
// import 'package:appdanhgia/screen/EmotionScreen.dart';
// import 'package:appdanhgia/screen/rate.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//   options: DefaultFirebaseOptions.currentPlatform,
// );
//   runApp( MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: EmotionScreen(),
//     );
//   }
// }



//     //   return Scaffold(
//     //     appBar:
//     //     AppBar(
//     //       title: Text('Emotion Selector'),
//     //     ),
//     //     body: Column(
//     //       children: [
//     //         Expanded(
//     //           child: ListView(
//     //             children: emotions.keys.map((emotion) {
//     //               return ListTile(
//     //                 title: Text(emotion),
//     //                 onTap: () {
//     //                   setState(() {
//     //                     selectedEmotion = emotion;
//     //                   });
//     //                   _showCommentDialog(emotion);
//     //                 },
//     //               );
//     //             }).toList(),
//     //           ),
//     //         ),
//     //         Text('Selected Emotion: $selectedEmotion'),
//     //         Text('Selected Comment: $selectedComment'),
//     //         ElevatedButton(
//     //           onPressed: () {
//     //             _sendData();
//     //           },
//     //           child: Text('Send Data'),
//     //         ),
//     //       ],
//     //     ),
//     //   );
//     // }

//     // void _showCommentDialog(String emotion) {
//     //   showDialog(
//     //     context: context,
//     //     builder: (BuildContext context) {
//     //       return AlertDialog(
//     //         title: Text('Select a Comment'),
//     //         content: Column(
//     //           children: emotions[emotion]!.map((comment) {
//     //             return ListTile(
//     //               title: Text(comment),
//     //               onTap: () {
//     //                 setState(() {
//     //                   selectedComment = comment;
//     //                 });
//     //                 Navigator.pop(context);
//     //               },
//     //             );
//     //           }).toList(),
//     //         ),
//     //       );
//     //     },
//     //   );
//     // }

//     // void _sendData() {
//     //   if (selectedEmotion.isNotEmpty && selectedComment.isNotEmpty) {
//     //     Map<String, dynamic> data = {
//     //       'emotion': selectedEmotion,
//     //       'comment': selectedComment,
//     //     };
//     //     String jsonData = jsonEncode(data);
//     //     print(jsonData);
//     //     // Add code to send jsonData to your server or perform other actions.
//     //   }
//     // }
import 'dart:async';

import 'package:appdanhgia/screen/EmotionScreen.dart';
import 'package:appdanhgia/screen/home.dart';
import 'package:appdanhgia/screen/rate.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      routes: {
        '/home': (context) => EmotionScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Đợi 3 giây trước khi chuyển đến màn hình chính
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromRGBO(47, 179, 178, 0.8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image.asset('assets/images/logo.jpg'),
            SizedBox(height: 30),
            Text(
              'CHÀO MỪNG ĐẾN VỚI ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Color.fromRGBO(255, 255, 255,1)),)
              ,SizedBox(height: 20,),
              Text('NHA KHOA VIỆT PHÁP',
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Color.fromRGBO(255, 255, 255,1)),
            ),
          ],
        ),
      ),
    );
  }
}



