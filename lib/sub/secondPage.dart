import 'package:flutter/material.dart';
import 'package:ugs/lectureItem.dart';

class SecondApp extends StatelessWidget {
  final List<Lecture>? list;
  SecondApp({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView.builder(
              itemBuilder: (context, position) {
                return GestureDetector(
                  child:  Card(
                    child: Row(
                      children: <Widget>[
                        Image.asset(list![position].imagePath! , height: 100, width: 100, fit: BoxFit.contain,),
                        Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(list![position].lectureName!),
                        ),
                        Spacer(),
                        Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text('${list![position].credit!}학점', textAlign: TextAlign.right),
                        ),
                      ],
                    ),
                  ),
                  onTap: (){
                    AlertDialog dialog = AlertDialog(
                      content: Text('이 과목은 ${list![position].kind} 입니다' , style: TextStyle(fontSize: 30.0),),
                    );
                    showDialog(
                        context: context, builder: (BuildContext context) => dialog);
                  },
                  onLongPress: (){
                    list!.removeAt(position);
                  },
                );
              },
              itemCount: list!.length),
        ),
      ),
    );
  }
}
