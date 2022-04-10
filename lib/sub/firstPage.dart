import 'package:flutter/material.dart';

class FirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Image.asset('unist_logo.png', width: 500, height: 500, fit: BoxFit.fill)
          ),
          Center(
            child: Text('UGS\nUNIST',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue, fontSize: 40),
            ),
          ),
        ],
      ),
    );
  }
}
