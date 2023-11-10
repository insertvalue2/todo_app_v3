import 'package:dio/dio.dart';
import 'api.dart';

// 전역 객체로 설정
// MIME TYPE -> json
final dio = Dio(
  BaseOptions(
    baseUrl: baseURL, // 반드시 내 IP 입력(cmd -> ipconfig 확인)
    contentType: "application/json; charset=utf-8",
  ),
);
