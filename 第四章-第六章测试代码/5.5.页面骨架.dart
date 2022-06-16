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
      home: const ScaffoldRoute(),
    );
  }
}

class ScaffoldRoute extends StatefulWidget {
  const ScaffoldRoute({Key? key}) : super(key: key);

  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: const Text("App Name"),
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(icon: const Icon(Icons.share), onPressed: () {}),
        ],
      ),
      drawer: const MyDrawer(), //抽屉
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
          //悬浮按钮
          child: const Icon(Icons.add),
          heroTag: FloatingActionButtonLocation.centerDocked,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return NewRoute();
              }),
            );
          }),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "images/Zombatar_1.png",
                        width: 80,
                      ),
                    ),
                  ),
                  const Text(
                    "yxyki",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: const <Widget>[
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Add account'),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class NewRoute extends StatelessWidget {
  final _floatingActioButoon = FloatingActionButton(
    onPressed: () {},
    child: const Icon(Icons.add),
    elevation: 0.0,
    backgroundColor: Colors.greenAccent,
    //修改为矩形
    // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                Expanded(
                  flex: 1,
                  child: TabBar(tabs: <Widget>[
                    Tab(text: "新闻"),
                    Tab(text: "历史"),
                    Tab(
                      text: "图片",
                    )
                  ]),
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            shape: const CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
            child: Row(
              children: [
                IconButton(icon: const Icon(Icons.home), onPressed: _onAdd),
                const SizedBox(), //中间位置空出
                IconButton(
                  icon: const Icon(Icons.business),
                  onPressed: _onAdd,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
            ),
          ),
          floatingActionButton: _floatingActioButoon,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: TabBarView(
            children: <Widget>[
              ListView(
                children: const <Widget>[
                  ListTile(
                      title: Text(
                        '新闻',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0, color: Colors.red),
                      ),
                      tileColor: Color.fromARGB(255, 196, 192, 192))
                ],
              ),
              ListView(
                children: const <Widget>[
                  ListTile(
                    title: Text(
                      '历史',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0, color: Colors.red),
                    ),
                    tileColor: Color.fromARGB(255, 196, 192, 192),
                  )
                ],
              ),
              ListView(
                children: const <Widget>[
                  ListTile(
                    title: Text(
                      '图片',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0, color: Colors.red),
                    ),
                    tileColor: Color.fromARGB(255, 196, 192, 192),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onAdd() {}
}
