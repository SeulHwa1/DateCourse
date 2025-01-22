import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoLoginApi {
  Future<User?> signWithKakao() async {
    final UserApi api = UserApi.instance;

    if (await isKakaoTalkInstalled()) {
      try {
        await api.loginWithKakaoTalk();
        return await api.me();
      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');

        // 사용자가 카카오톡 설치 후 로그인을 취소한 경우
        if (error is PlatformException && error.code == 'CANCELED') {
          return null;
        }

        // 카카오톡에 연결된 카카오계정이 없는 경우
        try {
          await UserApi.instance.loginWithKakaoAccount();
          return await api.me();
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
          return null;
        }
      }
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount();
        return await api.me();
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
        return null;
      }
    }
  }
}
