import 'package:flutter/material.dart';
import '../components/white_box1.dart'; // WhiteBox 가져오기
import 'date_plan.dart'; // DatePlan 가져오기

class RecommendScreen extends StatelessWidget {
  const RecommendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFB21C44), // 전체 배경색 설정 (빨간색)
        child: Column(
          children: [
            // WhiteBox 사용
            WhiteBox(
              title: "다가오는 데이트 일정",
              date: "D - n일",
              dateDetails: "(데이트날짜)",
              location: "(장소이름)",
              locationDetails: "외 1개 장소",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DatePlan()), // DatePlan으로 이동
                );
              },
            ),

            Expanded(
              child: Container(), // 나머지 공간은 투명하게 유지
            ),
          ],
        ),
      ),
    );
  }
}
