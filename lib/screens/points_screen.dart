import 'package:flutter/material.dart';

class PointsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("포인트 화면"),
      ),
      body: Center(
        child: Text(
          "여기는 포인트 화면입니다!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
