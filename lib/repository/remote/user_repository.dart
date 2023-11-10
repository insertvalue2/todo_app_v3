import '../../models/dto/user_dto.dart';
import '../../models/entity/user_entity.dart';

/*
외부 시스템에서 데이터 응답시에 공통 DTO를 설계하여
내려 받는 것이 효율적일 수 있습니다. 다만, 여기서는
데이터 타입에 맞게 각각 다르게 처리 하는 연습을 합니다.
 */
abstract class UserRepository {
  Future<int> requestCreateUser(UserDto userDto); // DB에 회원 등록 요청
  Future<UserEntity> requestSelectUser(
      String email, String password); // DB에 회원 조회 요청
}
