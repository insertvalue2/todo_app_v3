import '../dto/todo_dto.dart';

class TodoEntity {
  int id;
  int userId;
  String title;
  bool completed;

  TodoEntity(
      {required this.id,
      required this.userId,
      required this.title,
      required this.completed});

  //  Factory 생성자로 map 에서 TodoEntity 를 생성
  factory TodoEntity.fromJson(Map<String, dynamic> json) {
    return TodoEntity(
        id: json['id'],
        userId: json['userId'],
        title: json['title'],
        completed: json['completed']);
  }

  // Factory 생성자로 TodoDto에서 TodoEntity를 생성합니다.
  factory TodoEntity.fromDto(TodoDto todoDto) {
    return TodoEntity(
      id: todoDto.id ?? -1,
      title: todoDto.title,
      userId: todoDto.userId ?? -1,
      completed: todoDto.completed,
    );
  }

  @override
  String toString() {
    return 'TodoEntity{id: $id, userId: $userId, title: $title, completed: $completed}';
  }
}
