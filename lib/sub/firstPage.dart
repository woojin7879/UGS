import 'package:flutter/material.dart';

class FirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text('UGS\nUNIST',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue, fontSize: 40),
            ),
          ),
          Image.asset('unist_logo.png', width: 1000, height: 1000),
        ],
      ),
    );
  }
}
