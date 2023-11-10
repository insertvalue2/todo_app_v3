import 'package:todo_app_v3/models/service/user/user_service.dart';
import 'package:todo_app_v3/models/service/user/user_service_impl.dart';
import 'package:todo_app_v3/repository/local/memory_todo_repository_impl.dart';
import 'package:todo_app_v3/repository/local/memory_user_repository_impl.dart';
import 'package:todo_app_v3/repository/remote/todo_repository.dart';

import 'package:todo_app_v3/repository/remote/user_repository.dart';

class AppConfig {
  UserService getUserService() {
    return UserServiceImpl(getUserRepository());
  }

  UserRepository getUserRepository() {
    return MemoryUserRepositoryImpl();
  }

  TodoRepository getTodoRepository() {
    return MemoryTodoRepositoryImpl();
  }
}
