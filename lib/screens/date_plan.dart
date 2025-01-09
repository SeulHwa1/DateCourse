import 'package:flutter/material.dart';

class DatePlan extends StatelessWidget {
  const DatePlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("데이트 일정 페이지"),
      ),
      body: Center(
        child: Text(
          "여기는 데이트 일정 페이지입니다!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
