// import 'package:flutter/material.dart';
// import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
// import '../services/kakao_login_api.dart'; // KakaoLoginApi import

import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import '../services/kakao_login_api.dart';  // 상대 경로 확인

class UserController with ChangeNotifier {
  User? _user;
  KakaoLoginApi kakaoLoginApi;

  User? get user => _user;

  UserController({required this.kakaoLoginApi});

  // 카카오 로그인
  void kakaoLogin() async {
    kakaoLoginApi.signWithKakao().then((user) {
      // 반환된 값이 NULL이 아니라면
      // 정보 전달
      if (user != null) {
        _user = user;
        notifyListeners();
      }
    });
  }
}
