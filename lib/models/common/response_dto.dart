class ResponseDto<T> {
  String? token; // JWT 토큰 정보
  int code; // int -> 1: 성공, -1: 실패
  String message; // 서버(로컬)에서 넘겨 받는 메시지(사용자 dialog 에 활용)
  T? data; // 응답 받을 데이터

  ResponseDto(
      {this.token,
      required this.code,
      required this.message,
      required this.data});

  // 제네릭 VS dynamic
  // dynamic data;
  /*
    dynamic은 Dart의 동적 타입을 나타내는 키워드
    컴파일 시점에서 검사하지 않고, 실행 시간에 동적으로 결정
    (디버깅을 어렵게 만들 수 있다)
    컴파일 타임의 타입 안정성이 떨어진다
    IDE의 지원이 제한적이다
    런타임 오류 위험이 있다
   */
}
