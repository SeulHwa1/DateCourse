import 'package:flutter/material.dart';
import '../screens/notifications_screen.dart';
import '../screens/points_screen.dart';
import '../screens/recommend_screen.dart';

class AppBarTitle extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const AppBarTitle({
    required this.selectedIndex,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 왼쪽: 메인 & 추천피드
          Row(
            children: [
              GestureDetector(
                onTap: () => onTap(0), // 메인으로 이동
                child: Text(
                  "메인",
                  style: TextStyle(
                    color: selectedIndex == 0 ? Colors.black : Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () => onTap(1), // 추천피드 탭 유지
                child: Text(
                  "추천피드",
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
                    MaterialPageRoute(
                      builder: (context) => const PointsScreen(), // 포인트 화면
                    ),
                  );
                },
                child: const Text(
                  "포인트",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const NotificationsScreen(), // 알림 화면
                    ),
                  );
                },
                child: const Text(
                  "알림 >",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
