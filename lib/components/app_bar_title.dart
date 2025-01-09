import 'package:flutter/material.dart';
import '../screens/notifications_screen.dart'; // 경로 수정
import '../screens/points_screen.dart'; // 포인트 화면 경로도 추가

class AppBarTitle extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const AppBarTitle(
      {required this.selectedIndex, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // 양쪽 정렬
      children: [
        // 왼쪽: 메인 & 추천
        Row(
          children: [
            GestureDetector(
              onTap: () => onTap(0), // "메인" 선택
              child: Text(
                "메인",
                style: TextStyle(
                  color: selectedIndex == 0 ? Colors.black : Colors.grey,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(width: 16), // 메인과 추천 사이 간격 추가
            GestureDetector(
              onTap: () => onTap(1), // "추천" 선택
              child: Text(
                "추천",
                style: TextStyle(
                  color: selectedIndex == 1 ? Colors.black : Colors.grey,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        // 오른쪽: 포인트 & 알림
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PointsScreen()),
                );
              },
              child: Text(
                "포인트",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
            SizedBox(width: 16), // 포인트와 알림 사이 간격 추가
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationsScreen()),
                );
              },
              child: Text(
                "알림",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
