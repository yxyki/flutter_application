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
      //home: const ImageFcn(),
      home: const MyIcon(),
    );
  }
}

class ImageFcn extends StatelessWidget {
  const ImageFcn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('加载图片'),
      ),
      body: Center(
        child: Column(
            children: <Image>[
          Image.asset('images/Zombatar_1.png',
              width: 100, height: 50, fit: BoxFit.fill),
          Image.asset('images/Zombatar_1.png',
              width: 100, height: 50, fit: BoxFit.none),
          Image.asset('images/Zombatar_1.png',
              width: 100, height: 50, fit: BoxFit.contain),
          Image.asset('images/Zombatar_1.png',
              width: 100, height: 50, fit: BoxFit.cover),
          Image.asset('images/Zombatar_1.png',
              width: 100, height: 50, fit: BoxFit.fitWidth),
          Image.asset('images/Zombatar_1.png',
              width: 100, height: 50, fit: BoxFit.fitHeight)
        ].map((e) {
          return Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 100,
                  child: e,
                ),
              ),
              Text(e.fit.toString(),
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18.0,
                      height: 1.2,
                      fontFamily: "Courier",
                      background: Paint()
                        ..color = const Color.fromARGB(255, 213, 250, 6)))
            ],
          );
        }).toList()),
      ),
    );
  }
}

class MyIcon extends StatelessWidget {
  const MyIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('加载图片'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Icon(Icons.accessible, color: Colors.green),
            Icon(Icons.error, color: Colors.green),
            Icon(Icons.fingerprint, color: Colors.green),
          ],
        ),
      ),
    );
  }
}
