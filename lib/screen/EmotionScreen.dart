import 'package:appdanhgia/screen/PayCheck.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../aqiget.dart';
import 'package:database/database.dart';
class EmotionScreen extends StatefulWidget {
  @override
  _EmotionScreenState createState() => _EmotionScreenState();
}

class _EmotionScreenState extends State<EmotionScreen> {
  bool isTapped1 = false;
  bool isTapped2 = false;
  bool isTapped3 = false;
  bool isTapped4 = false;
 

  int selectedEmotion = -1;
  String selectedComment = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: 60,
          color: Color.fromRGBO(0, 0, 0, 1),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("MỜI ANH ",
                style: TextStyle(
                    fontSize: 24, color: Color.fromRGBO(255, 255, 255, 1))),
            Text(
              "ĐÁNH GIÁ",
              style: TextStyle(
                  fontSize: 24, color: Color.fromRGBO(222, 238, 5, 1)),
            ),
            Text(" CHẤT LƯỢNG DỊCH VỤ",
                style: TextStyle(
                    fontSize: 24, color: Color.fromRGBO(255, 255, 255, 1)))
          ]),
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
                onTap: () {
                  setState(() {
                    isTapped1 = !isTapped1;
                    isTapped2 = false;
                    isTapped3 = false;
                    isTapped4 = false;
                    if (isTapped1) {
                      selectedEmotion = 0;
                    } else {
                      selectedEmotion = -1;
                    }
                    print(selectedComment);
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.electric_meter_rounded,
                      size: 80,
                      color: isTapped1
                          ? const Color.fromARGB(255, 241, 244, 54)
                          : Colors.grey,
                    ),
                    Text("Tệ")
                  ],
                )),
            InkWell(
                onTap: () {
                  setState(() {
                    isTapped2 = !isTapped2;
                    isTapped1 = false;
                    isTapped3 = false;
                    isTapped4 = false;
                    if (isTapped2) {
                      selectedEmotion = 1;
                    } 
                    if(!isTapped2){
                      selectedEmotion = -1;
                    }
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.face_5_rounded,
                      size: 80,
                      color: isTapped2
                          ? const Color.fromARGB(255, 241, 244, 54)
                          : Colors.grey,
                    ),
                    Text("Tạm ổn")
                  ],
                )),
            InkWell(
                onTap: () {
                  setState(() {
                    isTapped3 = !isTapped3;
                    isTapped2 = false;
                    isTapped1 = false;
                    isTapped4 = false;
                    if (isTapped3) {
                      selectedEmotion = 2;
                    } else {
                      selectedEmotion = -1;
                    }
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.emoji_emotions_outlined,
                      size: 80,
                      color: isTapped3
                          ? const Color.fromARGB(255, 241, 244, 54)
                          : Colors.grey,
                    ),
                    Text("Tốt")
                  ],
                )),
            InkWell(
                onTap: () {
                  setState(() {
                    isTapped4 = !isTapped4;
                    isTapped2 = false;
                    isTapped3 = false;
                    isTapped1 = false;
                    if (isTapped4) {
                      selectedEmotion = 3;
                    } else {
                      selectedEmotion = -1;
                    }
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.emoji_emotions_sharp,
                      size: 80,
                      color: isTapped4
                          ? const Color.fromARGB(255, 241, 244, 54)
                          : Colors.grey,
                    ),
                    Text("Hoàn Hảo")
                  ],
                ))
          ],
        ),
        Comment(
          selectedEmotion: selectedEmotion,
        ),
      ]),
    );
  }
}

class Comment extends StatefulWidget {
  final int selectedEmotion;
  Comment({Key? key, required this.selectedEmotion}) : super(key: key);

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  List cmt = [];
  List selectCmt = [false, false, false,false];

  Future<void> postData(List cmt, int selectedEmoji) async {
    final apiUrl = 'https://kham1.free.beeceptor.com/todos/';

    // Tạo body request từ danh sách comment và emoji được chọn
    final Map<String, dynamic> requestBody = {
      'rate': {
        'comments': cmt,
        'selectedEmoji': selectedEmoji,
      }
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        // Xử lý khi nhận được phản hồi từ API
        print('Dữ liệu đã được gửi thành công');
        print(response.body);
      } else {
        // Xử lý khi có lỗi từ phía server
        print('Lỗi: ${response.statusCode}');
        print(response.body);
      }
    } catch (e) {
      // Xử lý khi có lỗi kết nối
      print('Lỗi kết nối: $e');
    }
  }
  int x=0; 
void postToFirebase(List cmt, int selectedEmoji) async {
  final databaseReference = FirebaseDatabase.instance.ref();
   
  
   setState(() {
    
    x=x+1;
  });
  final String path = '$x' ; // Đường dẫn trong database, bạn có thể thay đổi tùy ý

  try {
    await databaseReference.child(path).push().set({
      'comments':jsonEncode(cmt),
      'selectedEmoji': selectedEmoji,
    });

    print('Dữ liệu đã được gửi thành công lên Firebase');
  } catch (e) {
    print('Lỗi khi gửi dữ liệu lên Firebase: $e');
  }
}
  void _postApi() {
     postToFirebase(cmt,widget.selectedEmotion);
    postData(cmt, widget.selectedEmotion);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => PayCheck(
              apiService:
                  ApiService(apiUrl: 'https://fakestoreapi.com/products/1'))),
    );
  }

  void resetSelection() {
    setState(() {
      selectCmt = List.generate(
          emotions[widget.selectedEmotion]!.values.single.entries.length,
          (index) => false);
          selectCmt = [false, false, false,false];
    }
    );
  }

  Map<int, Map<String, Map<int, String>>> emotions = {
    0: {
      'Tệ': {
        0: 'Bảo vệ,nhân viên không nhiệt tình',
        1: 'Bác sĩ khám điều trị yếu kém',
        2: 'Chi phí cao',
        4: 'Chăm sóc sau điều trị kém'
      }
    },
    1: {
      'Tạm ổn': {
        0: 'Bảo vệ,nhân viên bình thường',
        1: 'Bác sĩ khám điều trị bình thường',
        2: 'Chi phí vừa phải',
 
      },
    },
    2: {
      'Tốt': {
        0: 'Bảo vệ,nhân viên nhiệt tình',
        1: 'Bác sĩ khám điều trị tốt',
        2: 'Chăm sóc sau điều trị tốt',

      },
    },
    3: {
      'Hoàn hảo': {
        0: 'Bảo vệ,nhân viên rất nhiệt tình ',
        1: 'Bác sĩ khám điều trị rất tốt',
        2: 'Chăm sóc sau điều trị chu đáo',
        
      }
    }
  };

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      if (widget.selectedEmotion != -1)
        Column(
          children: [
            Container(
              height: 250,
              child: 
              ListView.builder(
               
                  itemCount:
                   emotions[widget.selectedEmotion]
                      ?.values
                      .single
                      
                      .length,
                  // ((emotions[widget.selectedEmotion]?.values.single.entries.length)!/3).ceil(),
                  itemBuilder: (context, index) {
                   final value = emotions[widget.selectedEmotion]?.values.single.values;


                    return ListTile(
                      
                      tileColor: selectCmt[index]
                          ? Colors.amberAccent
                          : const Color.fromARGB(255, 255, 255, 255),
                      title: Text(
                       emotions[widget.selectedEmotion]!.values.single.values.elementAt(index)
                          ),
                      trailing: selectCmt[index]
                          ? Icon(Icons.check, color: Colors.green)
                          : null,
                      iconColor: !selectCmt[index]
                          ? Colors.amberAccent
                          : const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onTap: () {
                        setState(() {
                          if (widget.selectedEmotion == -1) {
                            cmt.clear();
                            resetSelection();
                          }

                          selectCmt[index] = !selectCmt[index];
                          if (selectCmt[index] && !cmt.contains(index)) {
                            cmt.add(index);
                          } else {
                            cmt.remove(index);
                          }
print(index);
                          print(cmt);
                          print(widget.selectedEmotion);
                          print(
                            emotions[widget.selectedEmotion]
                                ?.values
                                .single
                                .entries
                                .length,
                          );
                        });
                      },
                    );
                  }),
            ),
            SizedBox(
              height: 32,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: EdgeInsets.all(20),
                    backgroundColor: Color.fromRGBO(60, 179, 6, 1)),
                onPressed: _postApi,
                child: Text("SANG BƯỚC XÁC NHẬN GIÁ",
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontWeight: FontWeight.w600,
                        fontSize: 20)))
          ],
        ),
      if (widget.selectedEmotion == -1) ManHinhcho()
    ]);
  }
}

class ManHinhcho extends StatelessWidget {
  const ManHinhcho({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Image.asset('assets/images/pk.jpg'),
    );
  }
}
