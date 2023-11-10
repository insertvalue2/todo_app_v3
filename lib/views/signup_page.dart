import 'package:flutter/material.dart';
import 'package:todo_app_v3/view_models/signup_view_model.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final SignUpViewModel signUpViewModel = SignUpViewModel(); // 추후 수정 예정

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Getting Started"),
        backgroundColor: Colors.black,
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
                'Create an account',
                style: TextStyle(color: Colors.white, fontSize: 24),
                textAlign: TextAlign.left,
              ),
            ),
            const Divider(color: Colors.white70, height: 2),
            const SizedBox(height: 40),
            TextFormField(
              controller: usernameController,
              style: const TextStyle(color: Colors.white),
              decoration: inputDecoration.copyWith(hintText: 'USERNAME'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              style: const TextStyle(color: Colors.white),
              decoration: inputDecoration.copyWith(hintText: 'PASSWORD'),
              obscureText: true, // 비밀번호 숨기기
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              style: const TextStyle(color: Colors.white),
              decoration: inputDecoration.copyWith(hintText: 'EMAIL'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // 로그인 화면으로 이동하는 코드 작성 예정
              },
              child: const Text(
                'Already have an account? Sign in here.',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
