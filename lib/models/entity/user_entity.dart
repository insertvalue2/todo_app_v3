import '../service/user/grade.dart';

class UserEntity {
  final int userId;
  final String username;
  final String email;
  final String password;
  Grade? grade;

  UserEntity(
      {required this.userId,
      required this.username,
      required this.email,
      required this.password,
      this.grade});

  // Map<String, dynamic> 형태의 데이터를 앱에서 편하게 사용 하기 위해서 Object 타입 으로 변경
  // factory 생성자를 사용해야 오류 안남 - 일반 생성자는 return 키워드를 사용할 수 없음
  // factory 생성자는  새로운 인스턴스를 생성하는 것이 아니라
  // 가능한 기존에 인스턴스를 반환 및 조건에 따른 새로운 인스턴스 생성

  //  userId, username, email
  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
        userId: json['userId'],
        username: json['username'],
        email: json['email'],
        password: json['password'] ?? '',
        grade: json['grade'] ?? Grade.USER);
  }

  @override
  String toString() {
    return 'UserEntity{username: $username, email: $email, password: $password, grade: $grade}';
  }
}
