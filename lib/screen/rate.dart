import 'dart:async';

import 'package:appdanhgia/screen/EmotionScreen.dart';
import 'package:flutter/material.dart';

import '../model/rate.dart';
import '../services/rate_api.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double y;
}

class RateScreen extends StatefulWidget {
  const RateScreen({Key? key}) : super(key: key);

  @override
  _RateScreenState createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {
  bool isTapped1 = false;
  bool isTapped2 = false;
  bool isTapped3 = false;
  bool isTapped4 = false;

  int selectedEmotion = -1;
  List<Rate> rates = [];
  Map<int, dynamic> emoji = {0: 0, 1: 0, 2: 0, 3: 0};
  Map<int, Map<int, int>> cmt = {
    0: {0: 0, 1: 0, 2: 0, 3: 0, 4: 0},
    1: {0: 0, 1: 0, 2: 0, 3: 0, 4: 0},
    2: {0: 0, 1: 0, 2: 0, 3: 0, 4: 0},
    3: {0: 0, 1: 0, 2: 0, 3: 0, 4: 0}
  };

  @override
  void initState() {
    super.initState();
    // Fetch data immediately
    fetchData();
    // Schedule fetching data every 30 seconds (adjust as needed)
    Timer.periodic(Duration(seconds: 30), (Timer timer) {
      fetchData();
    });
  }

  Future<void> fetchData() async {
    final response = await RateApi.fetchRate();
    setState(() {
      rates = response;
      locRates();
    });
  }

  void locRates() {
    // Reset data to avoid accumulation
    emoji = {0: 0, 1: 0, 2: 0, 3: 0};
    cmt = {
      0: {0: 0, 1: 0, 2: 0, 3: 0, 4: 0},
      1: {0: 0, 1: 0, 2: 0, 3: 0, 4: 0},
      2: {0: 0, 1: 0, 2: 0, 3: 0, 4: 0},
      3: {0: 0, 1: 0, 2: 0, 3: 0, 4: 0}
    };

    for (var i = 0; i < rates.length; i++) {
      int currentId = rates[i].id;
      emoji[currentId]++;

      for (var j = 0; j < rates[i].comments.length; j++) {
        int currentComment = rates[i].comments.elementAt(j);
        cmt[currentId]?.update(j, (value) => value + 1, ifAbsent: () => 1);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(1, emoji[0]),
      ChartData(2, emoji[1]),
      ChartData(3, emoji[2]),
      ChartData(4, emoji[3]),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text('Đánh giá trung bình'),
        ),
        body: Column(children: [
          Container(
            child: SfCartesianChart(
              series: <ChartSeries<ChartData, int>>[
                ColumnSeries<ChartData, int>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
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
                        _showSimpleDialog(context, 0);
                      } else {
                        selectedEmotion = -1;
                      }
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
                        _showSimpleDialog(context, 1);
                      }
                      if (!isTapped2) {
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
                        _showSimpleDialog(context, 2);
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
                        _showSimpleDialog(context, 3);
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
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: _navigator, child: Text("Chuyển sang trang đánh giá"))
        ]));
  }

  void _navigator() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EmotionScreen()));
  }

  void _showSimpleDialog(BuildContext context, int tap) {
    final List<ChartData> chartData1 = [
      ChartData(1, cmt[tap]?[0] as double),
      ChartData(2, cmt[tap]?[1] as double),
      ChartData(3, cmt[tap]?[2] as double),
      ChartData(4, cmt[tap]?[3] as double),
    ];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 243, 33, 149),
              child: SfCartesianChart(
                series: <ChartSeries<ChartData, int>>[
                  ColumnSeries<ChartData, int>(
                    dataSource: chartData1,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
