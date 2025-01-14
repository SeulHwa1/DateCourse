import 'package:flutter/material.dart';

class DateLog extends StatelessWidget {
  const DateLog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("최근 데이트 로그"),
      ),
      body: Center(
        child: Text(
          "여기는 데이트 로그 페이지입니다!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
