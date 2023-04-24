import 'dart:convert';

import 'package:listadetarefas/models/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoRepository{

  TodoRepository(){
    SharedPreferences.getInstance().then((value) => sharedPreferences = value);
  }

  late SharedPreferences sharedPreferences;

  void SaveTodoList(List<Todo> todos){
    final jsonString = json.encode(todos);
    sharedPreferences.setString('todo_list', jsonString);
  }

}