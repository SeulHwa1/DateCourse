import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'screens/recommend_screen.dart';
import 'components/app_bar_title.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0; // 선택된 화면의 인덱스

  // 화면 리스트
  final List<Widget> _pages = [
    MainScreen(),
    RecommendScreen(),
  ];

  // AppBar 빌더 메서드
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xFFFFF8FA),
      title: AppBarTitle(
        selectedIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // 선택된 화면 변경
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _buildAppBar(), // AppBar 생성
        backgroundColor: Color(0xFFB21C44), // Body 배경색
        body: _pages[_selectedIndex], // 현재 선택된 화면 표시
      ),
    );
  }
}
