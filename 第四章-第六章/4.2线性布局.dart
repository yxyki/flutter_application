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
      home: const LinearLayout(),
    );
  }
}

class LinearLayout extends StatelessWidget {
  const LinearLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ConstrainedBox、SizedBox'),
        ),
        body: Row(children: <Widget>[
          // ConstrainedBox(
          //   constraints: const BoxConstraints(minWidth: double.infinity),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: const <Widget>[
          //       Text("hi"),
          //       Text("world"),
          //     ],
          //   ),
          // ),
          Container(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    child: Column(
                      mainAxisSize: MainAxisSize.max, //无效，内层Colum高度为实际高度
                      children: const <Widget>[
                        Text("hello world "),
                        Text("I am Jack "),
                        Text("Column包含Column")
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
                        children: const <Widget>[
                          Text("hello world "),
                          Text("I am Jack "),
                          Text("使用Expand组件")
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ]));
  }
}
