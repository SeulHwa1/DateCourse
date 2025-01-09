import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("알림 화면"),
      ),
      body: Center(
        child: Text(
          "여기는 알림 화면입니다!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
