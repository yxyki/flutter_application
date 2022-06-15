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
      home: const Alignout(),
    );
  }
}

class Alignout extends StatelessWidget {
  const Alignout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('对齐与相对定位(Align)'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              const Text("简单的Align对齐样例,使用偏移类Alignment",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 48, 5, 239),
                  )),
              Container(
                height: 120.0,
                width: 120.0,
                color: Colors.blue.shade50,
                child: const Align(
                  widthFactor: 2,
                  heightFactor: 2,
                  alignment: Alignment(2, 0.0),
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              ),
              const Text("使用偏移类FractionalOffset",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 48, 5, 239),
                  )),
              Container(
                height: 120.0,
                width: 120.0,
                color: Colors.blue[50],
                child: const Align(
                  alignment: FractionalOffset(0.2, 0.6),
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
