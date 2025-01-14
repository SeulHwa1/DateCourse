import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'screens/recommend_screen.dart';
import 'components/app_bar_title.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AppLayout(),
    );
  }
}

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _currentBottomIndex = 0; // 하단 네비게이션 바 상태
  int _currentTopIndex = 0; // 상단 네비게이션 바 상태

  // 하단 네비게이션 바 페이지
  final List<Widget> _bottomPages = [
    MainScreen(), // 홈 화면
    const SimpleScreen(title: "지도입니다."), // 지도 화면
    const SimpleScreen(title: "일정 화면입니다."), // 같이 걷기 화면
    const SimpleScreen(title: "서랍 화면입니다."), // 서랍 화면
    const SimpleScreen(title: "프로필 화면입니다."), // 프로필 화면
  ];

  // 상단 네비게이션 바 페이지
  final List<Widget> _topPages = [
    MainScreen(), // 상단 메인 화면
    RecommendScreen(), // 추천피드 화면
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentBottomIndex == 0 // 홈 탭에서만 상단바 표시
          ? PreferredSize(
              preferredSize: const Size.fromHeight(60.0),
              child: AppBarTitle(
                selectedIndex: _currentTopIndex,
                onTap: (index) {
                  setState(() {
                    _currentTopIndex = index; // 상단 네비게이션 바 상태 변경
                  });
                },
              ),
            )
          : null,
      body: _currentBottomIndex == 0
          ? _topPages[_currentTopIndex] // 상단 네비게이션 바 상태에 따라 화면 표시
          : _bottomPages[_currentBottomIndex], // 하단 네비게이션 바 상태에 따라 화면 표시
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentBottomIndex,
        onTap: (index) {
          setState(() {
            _currentBottomIndex = index; // 하단 네비게이션 바 상태 변경
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: '지도',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: '일정',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: '서랍',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '프로필',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
      ),
    );
  }
}

class SimpleScreen extends StatelessWidget {
  final String title;
  const SimpleScreen({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
