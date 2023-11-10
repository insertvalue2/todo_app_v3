import '../../models/common/response_dto.dart';
import '../../models/dto/todo_dto.dart';
import '../../models/entity/todo_entity.dart';
import '../../shared/d_log.dart';
import '../remote/todo_repository.dart';

class MemoryTodoRepositoryImpl implements TodoRepository {
  MemoryTodoRepositoryImpl._single();

  static final MemoryTodoRepositoryImpl _instance =
      MemoryTodoRepositoryImpl._single();

  factory MemoryTodoRepositoryImpl() {
    return _instance;
  }

  // 임시 데이터 - auto_increment 대신 사용
  static int todoSerialNumber = 5;

  // 샘플 데이터 추가
  List<TodoEntity> _list = [
    TodoEntity(id: 1, userId: 1, title: 'spring jwt 구축', completed: true),
    TodoEntity(id: 2, userId: 1, title: '영어회화', completed: false),
    TodoEntity(id: 3, userId: 1, title: '체육관가기', completed: false),
    TodoEntity(id: 4, userId: 2, title: '수영장가기', completed: false),
    TodoEntity(id: 5, userId: 2, title: '스키장가기', completed: false),
  ];

  @override
  Future<ResponseDto<TodoEntity>> requestCreateTodo(TodoDto todoDto) async {
    todoSerialNumber++;
    todoDto.id = todoSerialNumber;
    final todoEntity = TodoEntity.fromDto(todoDto);
    _list.add(todoEntity);

    print('--------------------');
    print(_list.toString());
    return ResponseDto<TodoEntity>(
      code: 1,
      message: '정상 등록 완료',
      data: todoEntity,
    );
  }

  @override
  Future<ResponseDto<bool>> requestDeleteTodo(int id, int userId) async {
    // Dart에서 List의 indexWhere 함수는 리스트에서 지정한 조건을 만족하는
    // 첫 번째 요소의 인덱스를 찾는데 사용됩니다.
    // 처음으로 true를 반환하는 요소의 인덱스를 반환
    // 요소가 없다면, -1을 반환
    final index =
        _list.indexWhere((todo) => todo.id == id && todo.userId == userId);

    if (index != -1) {
      _list.removeAt(index);
      dlog(_list.toString());
      // Creating a successful response
      return ResponseDto<bool>(
        code: 1,
        message: '삭제 완료',
        data: true,
      );
    } else {
      // Creating an error response
      return ResponseDto<bool>(
        code: -1,
        message: '잘못된 요청 입니다',
        data: false,
      );
    }
  }

  @override
  Future<ResponseDto<TodoEntity>> requestUpdateTodo(
      TodoDto todoDto, int userId) async {
    // TodoEntity 찾기
    final index = _list
        .indexWhere((todo) => todo.id == todoDto.id && todo.userId == userId);

    if (index != -1) {
      final updatedTodo = TodoEntity.fromDto(todoDto);
      _list[index] = updatedTodo;

      return ResponseDto<TodoEntity>(
        code: 1,
        message: '수정 완료',
        data: updatedTodo,
      );
    } else {
      // Creating an error response
      return ResponseDto<TodoEntity>(
        code: -1,
        message: '잘못된 요청 입니다',
        data: null,
      );
    }
  }

  @override
  Future<ResponseDto<List<TodoEntity>>> requestSelectTodoAll() async {
    dlog("Todo List All Check : \n${_list.toString()}");
    return ResponseDto<List<TodoEntity>>(
      code: 1,
      message: 'Todo 목록 전체 조회를 합니다',
      data: _list,
    );
  }
}
