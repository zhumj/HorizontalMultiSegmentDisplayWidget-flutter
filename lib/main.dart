import 'package:custom_widget/horizontal_multi_segment_display_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    double defaultValue = 37.5;
    List<double> doubleValues = [0, 18.5, 25.0, 30.0, 45.0,];
    List<String> stringValues = ['偏瘦', '健康', '偏胖', '肥胖',];
    List<Color> colorValues = [Colors.greenAccent, Colors.lightBlueAccent, Colors.orange, Colors.red,];

    double defaultValue1 = 1800;
    List<double> doubleValues1 = [0, 1329.6, 1994.4,];
    List<String> stringValues1 = ['不足', '标准'];
    List<Color> colorValues1 = [Colors.greenAccent, Colors.lightBlueAccent];

    double defaultValue2 = 52.5;
    List<double> doubleValues2 = [0, 50.4, 56.7, 69.3, 75.6, 113.4,];
    List<String> stringValues2 = ['不足', '过轻', '标准', '过重', '肥胖',];
    List<Color> colorValues2 = [Colors.greenAccent, Colors.lightGreen, Colors.lightBlueAccent, Colors.orange, Colors.red,];

    double defaultValue3 = 70.5;
    List<double> doubleValues3 = [0.0, 89.2, 107.2, 160.8,];
    List<String> stringValues3 = ['不足', '标准', '优', ];
    List<Color> colorValues3 = [Colors.greenAccent, Colors.lightBlueAccent, Colors.blueAccent];

    double defaultValue4 = 12.5;
    List<double> doubleValues4 = [0.0, 10, 14, 21.0,];
    List<String> stringValues4 = ['正常', '偏高', '严重偏高', ];
    List<Color> colorValues4 = [Colors.lightBlueAccent, Colors.orange, Colors.red];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
            color: Colors.brown,
            margin: EdgeInsets.only(top: 8),
            child: HorizontalMultiSegmentDisplayWidget(
              defaultValue, doubleValues, stringValues, colorValues,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
            color: Colors.brown,
            margin: EdgeInsets.only(top: 8),
            child: HorizontalMultiSegmentDisplayWidget(
              defaultValue1, doubleValues1, stringValues1, colorValues1,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
            color: Colors.brown,
            margin: EdgeInsets.only(top: 8),
            child: HorizontalMultiSegmentDisplayWidget(
              defaultValue2, doubleValues2, stringValues2, colorValues2,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
            color: Colors.brown,
            margin: EdgeInsets.only(top: 8),
            child: HorizontalMultiSegmentDisplayWidget(
              defaultValue3, doubleValues3, stringValues3, colorValues3,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
            color: Colors.brown,
            margin: EdgeInsets.only(top: 8),
            child: HorizontalMultiSegmentDisplayWidget(
              defaultValue4, doubleValues4, stringValues4, colorValues4,
            ),
          ),
        ],
      ),
    );
  }
}
