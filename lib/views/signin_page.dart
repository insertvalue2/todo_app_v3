import 'package:flutter/material.dart';
import 'package:todo_app_v3/view_models/signin_view_model.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // 공통 스타일 상수로 분리
  final inputDecoration = const InputDecoration(
    hintStyle: TextStyle(color: Colors.white70),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(22.0)),
      borderSide: BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(22.0)),
      borderSide: BorderSide(color: Colors.white),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    SignInViewModel signInViewModel = SignInViewModel(); // 추후 수정

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Spacer(), Text('GETTING STARTED')],
        ),
        backgroundColor: Colors.black,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            color: Colors.white70,
            height: 0.5,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Do You have\nan account?',
                style: TextStyle(color: Colors.white, fontSize: 24),
                textAlign: TextAlign.left,
              ),
            ),
            const Divider(color: Colors.white70, height: 2),
            const SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              style: const TextStyle(color: Colors.white),
              decoration: inputDecoration.copyWith(hintText: 'EMAIL'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              style: const TextStyle(color: Colors.white),
              decoration: inputDecoration.copyWith(hintText: 'PASSWORD'),
              obscureText: true, // 비밀번호 숨기기
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                //회원 가입 화면 으로 이동하는 코드 작성 예정
              },
              child: const Text('SIGN UP',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
