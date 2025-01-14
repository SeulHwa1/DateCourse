import 'package:flutter/material.dart';

class RecommendScreen extends StatelessWidget {
  const RecommendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "추천 화면입니다!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
