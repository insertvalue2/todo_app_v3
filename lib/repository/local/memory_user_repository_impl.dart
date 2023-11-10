import 'package:todo_app_v3/models/dto/user_dto.dart';
import 'package:todo_app_v3/models/entity/user_entity.dart';
import 'package:todo_app_v3/repository/remote/user_repository.dart';

// 싱글톤 처리
class MemoryUserRepositoryImpl extends UserRepository {
  // 임시 데이터
  static int userSerialNumber = 2;

  MemoryUserRepositoryImpl._single();

  static final MemoryUserRepositoryImpl _instance =
      MemoryUserRepositoryImpl._single();

  factory MemoryUserRepositoryImpl() {
    return _instance;
  }

  // 샘플 데이터 추가
  Map<String, UserEntity> _map = {
    'a@naver.com': UserEntity(
        userId: 1, username: '홍길동', email: 'a@naver.com', password: 'asd1234'),
    'b@kako.com': UserEntity(
        userId: 2, username: '이순신', email: 'b@kako.com', password: 'asd1234'),
  };

  @override
  Future<int> requestCreateUser(UserDto userDto) async {
    //  리터럴 직접 선언
    // .putIfAbsent() 메서드를 사용하여 키가 존재하지 않을 때만 값을 추가하는 방법
    // UserDto 에서 UserEntity 로 변환 하는 메서드를 만들어도 됨
    userSerialNumber++;
    UserEntity newUser = UserEntity(
        userId: userSerialNumber,
        username: userDto.username ?? '',
        email: userDto.email,
        password: userDto.password);

    _map.putIfAbsent(newUser.email, () => newUser);
    print(newUser.toString());
    // 현재 userSerialNumber 와 newUser 에 userId 같다면 정상 등록
    // 만약 값이 다르면 이미 동일한 이메일을 가진 사용자가 있다는 의미
    if (newUser.userId == userSerialNumber) {
      return 1;
    }
    return -1;
  }

  @override
  Future<UserEntity> requestSelectUser(String email, String password) async {
    UserEntity? user = _map[email];
    // 사용자를 찾았고 비밀번호가 일치하는 경우, 해당 사용자 반환
    if (user != null && user.password == password) {
      print("repo findUser : ${user.toString()}");
      return user;
    }
    // 사용자를 찾지 못했거나 비밀번호가 일치하지 않는 경우, 기본 UserEntity 반환
    return UserEntity(userId: -1, username: '', email: '', password: '');
  }
}
