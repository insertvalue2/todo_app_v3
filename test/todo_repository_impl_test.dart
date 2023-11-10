import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app_v3/app_config.dart';
import 'package:todo_app_v3/models/common/response_dto.dart';
import 'package:todo_app_v3/models/dto/todo_dto.dart';
import 'package:todo_app_v3/models/entity/user_entity.dart';
import 'package:todo_app_v3/repository/remote/todo_repository.dart';
import 'package:todo_app_v3/repository/remote/user_repository.dart';

void main() {
  late UserRepository userRepository;
  late TodoRepository todoRepository;
  late UserEntity findUser;
  setUp(() async {
    userRepository = AppConfig().getUserRepository();
    findUser = await userRepository.requestSelectUser('a@naver.com', 'asd1234');
    todoRepository = AppConfig().getTodoRepository();
  });

  group('== ToDo Repository 테스트 ==', () {
    test('Todo 생성 테스트', () async {
      // given
      TodoDto newTodo = TodoDto(title: '발표준비', completed: false);
      // when
      ResponseDto responseDto = await todoRepository.requestCreateTodo(newTodo);

      //then
      expect(responseDto, isA<ResponseDto>());
      expect(responseDto.code, 1);
      expect(responseDto.message, '정상 등록 완료');

      print('todo List : ${todoRepository.requestSelectTodoAll()}');
    });

    test('Todo 삭제 테스트 ', () async {
      // given
      int totoId = 1;

      // when
      ResponseDto responseDto =
          await todoRepository.requestDeleteTodo(totoId, findUser.userId);
      //then
      expect(responseDto, isA<ResponseDto>());
      expect(responseDto.code, 1);
      expect(responseDto.message, '삭제 완료');
      expect(responseDto.data, true);
    });

    test('Todo 수정 테스트 ', () async {
      int totoId = 1;

      // given
      TodoDto updateTodo = TodoDto(
          title: '==할일변경==',
          completed: true,
          id: totoId,
          userId: findUser.userId);

      // when
      ResponseDto responseDto =
          await todoRepository.requestUpdateTodo(updateTodo, findUser.userId);
      print("data 확인 : ${responseDto.data.toString()}");
      //then
      expect(responseDto, isA<ResponseDto>());
      expect(responseDto.code, 1);
      expect(responseDto.message, '수정 완료');
    });
  });
}
