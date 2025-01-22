import 'screens/main_screen.dart';
import 'screens/recommend_screen.dart';
import 'components/app_bar_title.dart';
// import 'screens/login_screen.dart'; // LoginScreen으로 변경
// import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
// import 'services/kakao_login_api.dart'; // KakaoLoginApi import
// import 'controllers/user_controller.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/login_screen.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import './services/kakao_login_api.dart';
import './controllers/user_controller.dart';  // 상대 경로로 변경

void main() {
      WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(
        nativeAppKey: 'c8e66f3eeb06886d59978305915d339d',
       
    );
   runApp(
    ChangeNotifierProvider(
      create: (_) => UserController(
        kakaoLoginApi: KakaoLoginApi(),
      ),
      child: const MyApp(),
    ),
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const AppLayout(),
//     );
//   }
// }
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<UserController>(
        builder: (context, userController, child) {
          // 사용자의 로그인 상태를 확인
          if (userController.user == null) {
            // 로그인되지 않은 경우 LoginScreen을 보여줌
            return const LoginScreen();
          } else {
            // 로그인된 경우 메인 앱 레이아웃을 보여줌
            return const AppLayout();
          }
        },
      ),
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
