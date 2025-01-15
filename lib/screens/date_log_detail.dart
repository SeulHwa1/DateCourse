import 'package:flutter/material.dart';

class DateLogDetail extends StatelessWidget {
  final int date; // 선택된 날짜

  const DateLogDetail({required this.date, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("로그 상세"),
        backgroundColor: const Color(0xFFB21C44),
      ),
      body: Center(
        child: Text(
          "12월 $date일의 로그입니다.", // 12월은 고정 값으로 표시
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
