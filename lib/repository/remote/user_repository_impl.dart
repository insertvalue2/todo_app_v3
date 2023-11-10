import 'dart:developer';
import 'dart:io'; // HttpStatus.ok 사용 하기 위함

import 'package:dio/dio.dart';
import 'package:todo_app_v3/models/dto/user_dto.dart';
import 'package:todo_app_v3/models/entity/user_entity.dart';
import 'package:todo_app_v3/shared/api.dart';
import 'package:todo_app_v3/shared/dio.dart';

import '../../shared/d_log.dart';
import 'user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  // 싱글톤 처리
  UserRepositoryImpl._single();
  static final UserRepositoryImpl _instance = UserRepositoryImpl._single();

  // factory 생성자
  factory UserRepositoryImpl() {
    return _instance;
  }

  @override
  Future<int> requestCreateUser(UserDto userDto) async {
    try {
      Response response = await dio.post(epSignUp, data: userDto);
      dlog("requestCreateUser 확인 :  ${response.toString()}");
      if (response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.created) {
        return response.data;
      }
      return -1;
    } catch (e) {
      dlog("requestCreateUser() 오류 : ${e.toString()}");
      return -1;
    }
  }

  @override
  Future<UserEntity> requestSelectUser(String email, String password) async {
    UserDto userDto = UserDto(password: password, email: email);
    try {
      Response response = await dio.post(epSignIn, data: userDto);
      dlog("requestSelectUser 확인 :  ${response.toString()}");
      dlog("response.statusCode : ${response.statusCode}");
      dlog(
          "pase UserEntity.fromJson(response.data) : ${UserEntity.fromJson(response.data)}");
      if (response.statusCode == HttpStatus.ok) {
        return UserEntity.fromJson(response.data);
      }
      return UserEntity(userId: -1, username: '', email: '', password: '');
    } catch (e) {
      dlog("requestSelectUser() 오류 : ${e.toString()}");
      return UserEntity(userId: -1, username: '', email: '', password: '');
    }
  }
}
