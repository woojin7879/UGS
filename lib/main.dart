import 'package:flutter/material.dart';
import 'package:ugs/sub/thirdPage.dart';

import 'sub/firstPage.dart';
import 'sub/secondPage.dart';
import 'lectureItem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  TabController? controller;
  List<Lecture> lectureList = List.empty(growable: true);
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    lectureList.add(Lecture(lectureName: "객체 지향 프로그래밍", kind: "전필", professor: "김 컴퓨터",
        credit: 3, imagePath: "assets/unist_logo.png"));
    lectureList.add(Lecture(lectureName: "운영체제", kind: "전필", professor: "빌 게이츠",
        credit: 3, imagePath: "assets/unist_logo.png"));
    lectureList.add(Lecture(lectureName: "나의 정체성", kind: "교양", professor: "김교양",
        credit: 3, imagePath: "assets/unist_logo.png"));
    lectureList.add(Lecture(lectureName: "시스템 프로그래밍", kind: "전필", professor: "김심스템",
        credit: 3, imagePath: "assets/unist_logo.png"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TabBar Example'),
        ),
        body: TabBarView(
          children: <Widget>[FirstApp(), SecondApp(list: lectureList), ThirdApp(list: lectureList)],
          controller: controller,
        ),
        bottomNavigationBar: TabBar(tabs: <Tab>[
          Tab(icon: Icon(Icons.home, color: Colors.blue),) ,
          Tab(icon: Icon(Icons.looks_two, color: Colors.blue),),
          Tab(icon: Icon(Icons.search, color: Colors.blue),)
        ], controller: controller,
        )
    );
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}