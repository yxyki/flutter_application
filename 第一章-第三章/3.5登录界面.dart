// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_final_fields

import 'dart:async';
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
      home: FocusTestRoute(),
    );
  }
}

class FocusTestRoute extends StatefulWidget {
  @override
  _FocusTestRouteState createState() => _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();
  bool? checked = false;
  var _state = 0;

  void animateProgress() {
    setState(() {
      _state = 1;
    });
    setState(() {
      Timer(Duration(milliseconds: 3000), () {
        setState(() {
          _state = 0;
        });
      });
    });
  }

  Widget? _setUpChild() {
    if (_state == 0) {
      return Text(
        "登录",
        style: TextStyle(color: Colors.white),
      );
    } else if (_state == 1) {
      return SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(
          strokeWidth: 5,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: kToolbarHeight), // 距离顶部一个工具栏的高度
            buildKuang(context),
            SizedBox(
              height: 10.0,
            ),
            PrivacyWidget(
              onChanged: (value) {
                checked = value;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildKuang(BuildContext context) {
    return Form(
      key: _formKey, //设置globalKey，用于后面获取FormState
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: <Widget>[
          TextFormField(
            autofocus: true,
            controller: _unameController,
            decoration: InputDecoration(
              labelText: "用户名",
              hintText: "用户名或邮箱",
              icon: Icon(Icons.person),
            ),
            // 校验用户名
            validator: (v) {
              return v!.trim().isNotEmpty ? null : "用户名不能为空";
            },
          ),
          TextFormField(
            controller: _pwdController,
            decoration: InputDecoration(
              labelText: "密码",
              hintText: "您的登录密码",
              icon: Icon(Icons.lock),
            ),
            obscureText: true,
            //校验密码
            validator: (v) {
              return v!.trim().length > 5 ? null : "密码不能少于6位";
            },
          ),
          // 登录按钮
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: _setUpChild(),
                    ),
                    onPressed: () {
                      setState(() {
                        if (_state == 0) {
                          animateProgress();
                        } else {
                          return;
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PrivacyWidget extends StatefulWidget {
  const PrivacyWidget({Key? key, required this.onChanged}) : super(key: key);
  final ValueChanged<bool?> onChanged;

  @override
  _PrivacyWidgetState createState() => _PrivacyWidgetState();
}

class _PrivacyWidgetState extends State<PrivacyWidget> {
  bool? checked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: checked,
            onChanged: (value) {
              widget.onChanged(value);
              setState(() {
                checked = value;
              });
            }),
        Text(
          '同意',
          style: TextStyle(fontSize: 14.0),
        ),
        Text(
          '<服务协议>',
          style: TextStyle(fontSize: 14.0, color: Colors.blue),
        ),
        Text(
          '和',
          style: TextStyle(fontSize: 14.0),
        ),
        Text('<隐私政策>', style: TextStyle(fontSize: 14.0, color: Colors.blue)),
      ],
    );
  }
}
