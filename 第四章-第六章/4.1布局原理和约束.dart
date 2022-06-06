// ignore_for_file: prefer_const_constructors, must_be_immutable

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
      home: Constrainedbox(),
    );
  }
}

class Constrainedbox extends StatelessWidget {
  Constrainedbox({Key? key}) : super(key: key);

  Widget redBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ConstrainedBox、SizedBox'),
          actions: const <Widget>[
            UnconstrainedBox(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation(Colors.white70),
                ),
              ),
            )
          ],
        ),
        body: Column(children: <Widget>[
          Text("这是ConstrainedBox",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Color.fromARGB(255, 48, 5, 239),
              )),
          ConstrainedBox(
            constraints:
                BoxConstraints(minWidth: double.infinity, minHeight: 50.0),
            // ignore: sized_box_for_whitespace
            child: Container(
              height: 5.0,
              child: redBox,
            ),
          ),
          Text("这是SizededBox",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Color.fromARGB(255, 48, 5, 239),
              )),
          SizedBox(
            width: 80,
            height: 80,
            child: redBox,
          ),
          Text("这是多重限制",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Color.fromARGB(255, 48, 5, 239),
              )),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0), //父
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
              child: redBox,
            ),
          ),
          Text("这是UnconstrainedBox(去除父级限制)",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Color.fromARGB(255, 48, 5, 239),
              )),
          ConstrainedBox(
              constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0), //父
              child: UnconstrainedBox(
                //“去除”父级限制
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
                  child: redBox,
                ),
              )),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: double.infinity),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                Text("hi"),
                Text("world"),
              ],
            ),
          )
        ]));
  }
}
