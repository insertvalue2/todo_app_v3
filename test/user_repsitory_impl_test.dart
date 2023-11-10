import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app_v3/app_config.dart';
import 'package:todo_app_v3/models/dto/user_dto.dart';
import 'package:todo_app_v3/models/entity/user_entity.dart';
import 'package:todo_app_v3/repository/remote/user_repository.dart';

void main() {
  late UserRepository userRepository;
  late UserDto newUser;

  setUp(() {
    userRepository = AppConfig().getUserRepository();
    newUser = UserDto(
        password: 'asd1234', email: 'b@naver.com', username: 'testUserA');
  });

  group('회원 도메인 테스트', () {
    test('회원 가입 성공 테스트', () async {
      // given
      // setup ..

      // when
      int result = await userRepository.requestCreateUser(newUser);

      print('result : ${result}');
      // then
      expect(result, isA<int>());
      expect(result, 1);
    });

    // test('회원 가입 실패 테스트', () async {
    //   // given
    //   // setup ..
    //
    //   // when - newUser : email -> Unique
    //   int result = await userRepository.requestCreateUser(newUser);
    //
    //   // then
    //   expect(result, isA<int>());
    //   expect(result, -1);
    // });

    test('회원 로그인 테스트', () async {
      // 상태 변경(없는 사용자 요청)
      // newUser.email = "x@naver.com";

      // when - newUser
      UserEntity userEntity = await userRepository.requestSelectUser(
          newUser.email, newUser.password);
      print('result : ${userEntity.toString()}');

      // then
      expect(userEntity, isA<UserEntity>());
      expect(userEntity.email, equals('b@naver.com'));
    });
  });
}
