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
      home: const listView(title: 'ListView'),
    );
  }
}

// ignore: camel_case_types
class listView extends StatelessWidget {
  const listView({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      // body: ListView.builder(
      //     itemCount: 100,
      //     itemExtent: 50.0, //强制高度为50.0
      //     itemBuilder: (BuildContext context, int index) {
      //       return ListTile(title: Text("$index"));
      //     }),
      body: ListView3(),
    );
  }
}

// // ignore: use_key_in_widget_constructors
// class ListViewRoute extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
//     return Scrollbar(
//       // 显示进度条
//       child: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Center(
//           child: Column(
//             //动态创建一个List<Widget>
//             children: str
//                 .split("")
//                 //每一个字母都用一个Text显示,字体为原来的两倍
//                 .map((c) => Text(
//                       c,
//                       textScaleFactor: 2.0,
//                     ))
//                 .toList(),
//           ),
//         ),
//       ),
//     );
//   }
// }

// ignore: use_key_in_widget_constructors
class ListView3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复用。
    Widget divider1 = const Divider(
      color: Colors.blue,
    );
    Widget divider2 = const Divider(color: Colors.green);
    return ListView.separated(
      itemCount: 100,
      //列表项构造器
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text("$index"));
      },
      //分割器构造器
      separatorBuilder: (BuildContext context, int index) {
        return index % 2 == 0 ? divider1 : divider2;
      },
    );
  }
}
