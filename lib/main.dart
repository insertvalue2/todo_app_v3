import 'package:flutter/material.dart';
import 'package:todo_app_v3/views/signin_page.dart';
import 'package:todo_app_v3/views/signup_page.dart';

void main() {
  runApp(const MyTodoApp());
}

class MyTodoApp extends StatelessWidget {
  const MyTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: SignUpPage(),
      ),
    );
  }
}
