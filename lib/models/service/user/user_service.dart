import 'package:todo_app_v3/models/dto/user_dto.dart';
import '../../entity/user_entity.dart';

abstract class UserService {
  Future<int> signUp(UserDto userDto);
  Future<UserEntity> signIn(String email, String password);
  void upGrade(UserDto userDto);
  void downGrade(UserDto userDto);
  void saveUserEmail(String email);
}
