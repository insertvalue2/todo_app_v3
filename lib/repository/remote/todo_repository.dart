import '../../models/dto/todo_dto.dart';
import '../../models/common/response_dto.dart';

abstract class TodoRepository {
  // 생성, 삭제, 수정, 전체 조회
  Future<ResponseDto> requestCreateTodo(TodoDto todoDto);
  Future<ResponseDto> requestDeleteTodo(int id, int userId);
  Future<ResponseDto> requestUpdateTodo(TodoDto todoDto, int userId);
  Future<ResponseDto> requestSelectTodoAll();
}
