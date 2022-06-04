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
      home: const SwitchAndCheckBoxTestRoute(
        title: '单选开关和复选框',
      ),
    );
  }
}

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  const SwitchAndCheckBoxTestRoute({Key? key, required this.title})
      : super(key: key);
  final String title;
  @override
  _SwitchAndCheckBoxTestRouteState createState() =>
      _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState
    extends State<SwitchAndCheckBoxTestRoute> {
  bool _swithSelected = true; // 单选开关的状态，我们默认选中
  bool _checkBoxSelected = true; //  复选框的状态，我们默认选中

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Switch(
              value: _swithSelected, // 当前状态
              onChanged: (value) {
                //状态监听， 重新构建状态
                setState(() {
                  _swithSelected = value;
                });
              },
            ),
            Checkbox(
              value: _checkBoxSelected,
              activeColor: Colors.blue, //选中时的颜色
              onChanged: (value) {
                setState(() {
                  _checkBoxSelected = value!;
                });
              },
            ),
          ],
        ));
  }
}
