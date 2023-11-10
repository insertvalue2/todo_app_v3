import 'package:flutter/foundation.dart';

// 로그 메서드 만들어 보기(배포,개발 모드 구분)
// 개발 모드에서만 로그가 동작할 수 있도록 분리
// import 'package:flutter/foundation.dart'; 필요
void dlog(dynamic message) {
  if (kDebugMode) {
    debugPrint(message.toString());
  }
}
