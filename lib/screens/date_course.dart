import 'package:flutter/material.dart';

class DateCourse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("최근 데이트 서랍 (코스)"),
      ),
      body: Center(
        child: Text(
          "여기는 데이트 서랍(코스) 입니다!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
