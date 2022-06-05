// ignore_for_file: prefer_const_constructors

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
      home: const ContainerTestRoute(),
    );
  }
}

class ContainerTestRoute extends StatelessWidget {
  const ContainerTestRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('容器组件(Container)'),
      ),
      body: Column(
        children: [
          const SizedBox(height: kToolbarHeight), // 距离顶部一个工具栏的高度
          Containerbuild(context)
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Containerbuild(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "这是容器组件",
          style: TextStyle(
              color: Colors.blue,
              fontSize: 18.0,
              height: 1.2,
              fontFamily: "Courier",
              background: Paint()
                ..color = const Color.fromARGB(255, 227, 239, 229),
              decorationStyle: TextDecorationStyle.dashed),
        ),
        Container(
          margin: EdgeInsets.only(top: 50.0, left: 120.0),
          constraints:
              BoxConstraints.tightFor(width: 200.0, height: 150.0), //卡片大小
          decoration: BoxDecoration(
            //背景装饰
            gradient: RadialGradient(
              //背景径向渐变
              colors: const [Colors.red, Colors.orange],
              center: Alignment.topLeft,
              radius: .98,
            ),
            boxShadow: const [
              //卡片阴影
              BoxShadow(
                color: Colors.black54,
                offset: Offset(2.0, 2.0),
                blurRadius: 4.0,
              )
            ],
          ),
          transform: Matrix4.rotationZ(.2), //卡片倾斜变换
          alignment: Alignment.center, //卡片内文字居中
          child: Text(
            //卡片文字
            "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
          ),
        ),
        const SizedBox(
          width: 50,
          height: 50,
        ),
        Container(
          margin: EdgeInsets.all(20.0), //容器外补白
          color: Colors.orange,
          child: Text("Hello world!(margin容器外补白)"),
        ),
        Container(
          padding: EdgeInsets.all(20.0), //容器内补白
          color: Colors.orange,
          child: Text("Hello world!(padding容器内补白)"),
        ),
      ],
    );
  }
}
