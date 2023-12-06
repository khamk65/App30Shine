import 'dart:convert';
import 'package:appdanhgia/screen/EmotionScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EmotionScreen(),
    );
  }
}



    //   return Scaffold(
    //     appBar:
    //     AppBar(
    //       title: Text('Emotion Selector'),
    //     ),
    //     body: Column(
    //       children: [
    //         Expanded(
    //           child: ListView(
    //             children: emotions.keys.map((emotion) {
    //               return ListTile(
    //                 title: Text(emotion),
    //                 onTap: () {
    //                   setState(() {
    //                     selectedEmotion = emotion;
    //                   });
    //                   _showCommentDialog(emotion);
    //                 },
    //               );
    //             }).toList(),
    //           ),
    //         ),
    //         Text('Selected Emotion: $selectedEmotion'),
    //         Text('Selected Comment: $selectedComment'),
    //         ElevatedButton(
    //           onPressed: () {
    //             _sendData();
    //           },
    //           child: Text('Send Data'),
    //         ),
    //       ],
    //     ),
    //   );
    // }

    // void _showCommentDialog(String emotion) {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: Text('Select a Comment'),
    //         content: Column(
    //           children: emotions[emotion]!.map((comment) {
    //             return ListTile(
    //               title: Text(comment),
    //               onTap: () {
    //                 setState(() {
    //                   selectedComment = comment;
    //                 });
    //                 Navigator.pop(context);
    //               },
    //             );
    //           }).toList(),
    //         ),
    //       );
    //     },
    //   );
    // }

    // void _sendData() {
    //   if (selectedEmotion.isNotEmpty && selectedComment.isNotEmpty) {
    //     Map<String, dynamic> data = {
    //       'emotion': selectedEmotion,
    //       'comment': selectedComment,
    //     };
    //     String jsonData = jsonEncode(data);
    //     print(jsonData);
    //     // Add code to send jsonData to your server or perform other actions.
    //   }
    // }

