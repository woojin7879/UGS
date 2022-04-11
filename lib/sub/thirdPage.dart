import 'package:flutter/material.dart';
import 'package:ugs/lectureItem.dart';

class ThirdApp extends StatefulWidget {
  final List<Lecture>? list;
  ThirdApp({Key? key, this.list}) : super(key: key);

  @override
  State<ThirdApp> createState() => _ThirdAppState(list);
}

class _ThirdAppState extends State<ThirdApp> {
  final List<Lecture>? list;
  _ThirdAppState(this.list);
  List<Lecture>? lectureListSearch;
  final FocusNode _textFocusNode = FocusNode();
  TextEditingController? _textEditingController = TextEditingController();
  @override
  void dispose() {
    _textFocusNode.dispose();
    _textEditingController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _textEditingController!.text.isNotEmpty
        ? lectureListSearch
        : lectureListSearch = List.from(list!);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue.shade300,
          title: Container(
            decoration: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(20)),
            child: TextField(
              controller: _textEditingController,
              focusNode: _textFocusNode,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: 'Search here',
                  contentPadding: EdgeInsets.all(8)),
              onChanged: (value) {
                setState(() {
                  lectureListSearch = list
                      ?.where(
                          (element) => element.same(value.toLowerCase()))
                      .toList();
                  if (_textEditingController!.text.isNotEmpty &&
                      lectureListSearch!.length == 0) {
                    print('foodListSearch length ${lectureListSearch!.length}');
                  }
                });
              },
            ),
          )),
      body: Container(
        child: Center(
          child: ListView.builder(
              itemCount: _textEditingController!.text.isNotEmpty
                  ? lectureListSearch!.length
                  : list!.length,
              itemBuilder: (context, position) {
                return GestureDetector(
                  child:  Card(
                    child: Row(
                      children: <Widget>[
                        Image.asset(lectureListSearch![position].imagePath! , height: 100, width: 100, fit: BoxFit.contain,),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(lectureListSearch![position].lectureName!),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Text('${lectureListSearch![position].credit!}학점', textAlign: TextAlign.right),
                        ),
                      ],
                    ),
                  ),
                  onTap: (){
                    AlertDialog dialog = AlertDialog(
                      content: Text('이 과목은 ${lectureListSearch![position].kind} 입니다' , style: TextStyle(fontSize: 30.0),),
                    );
                    showDialog(
                        context: context, builder: (BuildContext context) => dialog);
                  },
                  onLongPress: (){
                    lectureListSearch!.removeAt(position);
                  },
                );
              },
          ),
        ),
      ),
    );
  }
}