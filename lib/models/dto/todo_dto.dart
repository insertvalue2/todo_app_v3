class TodoDto {
  String title;
  bool completed;
  int? id; // 수정 및 삭제 요청시 필요
  int? userId;

  TodoDto({required this.title, required this.completed, this.id, this.userId});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'completed': completed,
      'id': id ?? '',
      'userId': userId ?? ''
    };
  }

  @override
  String toString() {
    return 'TodoDto{title: $title, completed: $completed, id: $id, userId: $userId}';
  }
}
