import 'package:todo_app_v3/models/dto/user_dto.dart';
import 'package:todo_app_v3/models/entity/user_entity.dart';
import 'package:todo_app_v3/repository/remote/user_repository.dart';
import 'user_service.dart';

// UserServiceImpl 에서는 UserRepository 에게 통신 요청 일을 위임 시킨다
// UserServiceImpl 은 UserRepository 응답 후 데이터 관리를 ??? 위임 처리
class UserServiceImpl extends UserService {
  // DIP - 구현 클래스가 아닌 추상 클래스에 의존해야 한다.
  UserRepository _userRepository;

  // 생성자 의존 관계 주입
  UserServiceImpl(this._userRepository);

  @override
  Future<UserEntity> signIn(String email, String password) async {
    UserEntity userEntity =
        await _userRepository.requestSelectUser(email, password);
    // TODO:  응답된 데이터 추후 상태 관리 처리
    return userEntity;
  }

  @override
  Future<int> signUp(UserDto userDto) async {
    int result = await _userRepository.requestCreateUser(userDto);
    // TODO:  응답된 데이터 추후 상태 관리 처리
    return result;
  }

  @override
  void downGrade(UserDto userDto) {
    // TODO: 추후 기능 기발
  }

  @override
  void saveUserEmail(String email) {
    // TODO: 추후 기능 기발
  }

  @override
  void upGrade(UserDto userDto) {
    // TODO: 추후 기능 기발
  }
}
