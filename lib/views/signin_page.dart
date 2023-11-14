import 'package:flutter/material.dart';
import 'package:todo_app_v3/view_models/signin_view_model.dart';
import 'package:todo_app_v3/views/signup_page.dart';

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
    // 1.추후 리버팟으로 변경
    // view 는 view_model 참조 값 을 직접 가지고 있어야 한다.
    SignInViewModel signInViewModel = SignInViewModel(); // 추후 수정

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

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
            ElevatedButton(
              onPressed: () {},
              child: Text('SIGN-IN'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              child: const Text('New user? Create an account',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
