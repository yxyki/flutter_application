import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'PageView'));
  }
}

// Tab 页面
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        automaticallyImplyLeading: false,
        title: Text(widget.title),
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        reverse: false,
        controller: PageController(
          initialPage: 0,
          viewportFraction: 1,
          keepPage: true,
        ),
        physics: const BouncingScrollPhysics(),
        pageSnapping: true,
        onPageChanged: (index) {
          //监听事件
          print('index=====$index');
        },
        children: <Widget>[
          Container(
            color: Colors.grey,
            child: const Center(
              child: Text(
                '第1页',
                textScaleFactor: 4,
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
            ),
          ),
          Container(
            color: Colors.greenAccent,
            child: const Center(
              child: Text(
                '第2页',
                textScaleFactor: 4,
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
            ),
          ),
          Container(
            color: Colors.deepOrange,
            child: const Center(
              child: Text(
                '第3页',
                textScaleFactor: 4,
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
