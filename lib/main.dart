import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'screens/recommend_screen.dart';
import 'screens/drawer_screen.dart';
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
  int _currentBottomIndex = 0;
  int _currentTopIndex = 0;

  // 하단 네비게이션 바 페이지
  final List<Widget> _bottomPages = [
    const MainScreen(),
    const Center(child: Text('지도 화면')), // Placeholder for map screen
    const Center(child: Text('일정 화면')), // Placeholder for schedule screen
    const DrawerScreen(), // 서랍 화면
    const Center(child: Text('프로필 화면')), // Placeholder for profile screen
  ];

  // 상단 네비게이션 바 페이지
  final List<Widget> _topPages = [
    const MainScreen(),
    const RecommendScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentBottomIndex == 0
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
      body: _bottomPages[_currentBottomIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentBottomIndex,
        onTap: (index) {
          setState(() {
            _currentBottomIndex = index;
            if (index != 0) _currentTopIndex = 0; // 상단 네비게이션 바 초기화
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: _currentBottomIndex == 0
                ? const Icon(Icons.home)
                : const Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _currentBottomIndex == 1
                ? const Icon(Icons.map)
                : const Icon(Icons.map_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _currentBottomIndex == 2
                ? const Icon(Icons.event)
                : const Icon(Icons.event_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _currentBottomIndex == 3
                ? const Icon(Icons.menu)
                : const Icon(Icons.menu_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _currentBottomIndex == 4
                ? const Icon(Icons.person)
                : const Icon(Icons.person_outline),
            label: '',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
