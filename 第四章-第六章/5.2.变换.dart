import 'package:flutter/material.dart';
import 'dart:math' as math;

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
      home: const TransformTestRoute(),
    );
  }
}

class TransformTestRoute extends StatelessWidget {
  const TransformTestRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('变换(Transform)'),
      ),
      body: Column(
        children: [
          const SizedBox(height: kToolbarHeight), // 距离顶部一个工具栏的高度
          Decorationbuild(context)
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Decorationbuild(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "这是倾斜操作",
          style: TextStyle(
              color: Colors.blue,
              fontSize: 18.0,
              height: 1.2,
              fontFamily: "Courier",
              background: Paint()
                ..color = const Color.fromARGB(255, 227, 239, 229),
              decorationStyle: TextDecorationStyle.dashed),
        ),
        const SizedBox(
          width: 50,
          height: 50,
        ),
        Container(
          color: Colors.black,
          child: Transform(
            alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
            transform: Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.deepOrange,
              child: const Text('Apartment for rent!'),
            ),
          ),
        ),
        Text(
          "这是平移操作",
          style: TextStyle(
              color: Colors.blue,
              fontSize: 18.0,
              height: 1.2,
              fontFamily: "Courier",
              background: Paint()
                ..color = const Color.fromARGB(255, 227, 239, 229),
              decorationStyle: TextDecorationStyle.dashed),
        ),
        DecoratedBox(
          decoration: const BoxDecoration(color: Colors.red),
          //默认原点为左上角，左移20像素，向上平移5像素
          child: Transform.translate(
            offset: const Offset(-20.0, -5.0),
            child: const Text("Hello world"),
          ),
        ),
        Text(
          "这是旋转操作",
          style: TextStyle(
              color: Colors.blue,
              fontSize: 18.0,
              height: 1.2,
              fontFamily: "Courier",
              background: Paint()
                ..color = const Color.fromARGB(255, 227, 239, 229),
              decorationStyle: TextDecorationStyle.dashed),
        ),
        const SizedBox(
          width: 50,
          height: 50,
        ),
        DecoratedBox(
          decoration: const BoxDecoration(color: Colors.red),
          child: Transform.rotate(
            //旋转90度
            angle: math.pi / 2,
            child: const Text("Hello world"),
          ),
        ),
        const SizedBox(
          width: 50,
          height: 50,
        ),
        Text(
          "这是缩放操作",
          style: TextStyle(
              color: Colors.blue,
              fontSize: 18.0,
              height: 1.2,
              fontFamily: "Courier",
              background: Paint()
                ..color = const Color.fromARGB(255, 227, 239, 229),
              decorationStyle: TextDecorationStyle.dashed),
        ),
        DecoratedBox(
            decoration: const BoxDecoration(color: Colors.red),
            child: Transform.scale(
                scale: 1.5, //放大到1.5倍
                child: const Text("Hello world"))),
        const SizedBox(
          width: 50,
          height: 50,
        ),
        Text(
          "这是旋转操作(是在布局阶段)",
          style: TextStyle(
              color: Colors.blue,
              fontSize: 18.0,
              height: 1.2,
              fontFamily: "Courier",
              background: Paint()
                ..color = const Color.fromARGB(255, 227, 239, 229),
              decorationStyle: TextDecorationStyle.dashed),
        ),
        const DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          //将Transform.rotate换成RotatedBox
          child: RotatedBox(
            quarterTurns: 1, //旋转90度(1/4圈)
            child: Text("Hello world"),
          ),
        ),
        const Text(
          "你好",
          style: TextStyle(color: Colors.green, fontSize: 18.0),
        )
      ],
    );
  }
}
