import '../service/user/grade.dart';

/*
  회원 가입, 로그인 요청 공통 사용
  username 은 회원 가입시만 필요
 */
class UserDto {
  String? username;
  String email;
  String password;
  Grade? grade;

  UserDto(
      {this.username, required this.password, required this.email, this.grade});

  // JSON 형식에 문자열로 변경하기 위해 Object 를 Map<String, dynamic> 으로 변경 해야 한다.
  // dio 라이브러리를 사용하기 위해서는 toJson 이라는 메서드를 반드시 만들어야 동작 한다.
  Map<String, dynamic> toJson() {
    return {
      'username': username ?? '',
      'password': password,
      'email': email,
      'grade': grade ?? 'USER'
    };
  }

  @override
  String toString() {
    return 'UserDto{username: ${username ?? ''}, password: $password, email: $email, grade: ${grade ?? ''}';
  }
}
