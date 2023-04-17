import 'package:flutter/material.dart';
import 'package:listadetarefas/models/todo.dart';
import 'package:listadetarefas/widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();

  List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: todoController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Adicione um tarefa',
                          hintText: 'Ex: Estudar Flutter',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          String text = todoController.text;
                          setState(() {
                            Todo newTodo = Todo(
                                title: text, dateTime: DateTime.now()
                            );
                            todos.add(newTodo);
                          });
                          todoController.clear();
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff00d7f3),
                            padding: EdgeInsets.all(14)),
                        child: Icon(
                          Icons.add,
                          size: 30,
                        )
                    )
                  ],
                ),
                SizedBox(height: 16,),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (Todo todo in todos)
                        TodoListItem(
                          todo: todo,
                          onDelete: onDelete,
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 16,),
                Row(children: [
                  Expanded(child: Text(
                      'Você possui ${todos.length} tarefas pendentes')),
                  SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {
                    },
                    child: Text('Limpar Tudo'),
                    style: ElevatedButton.styleFrom(primary: Color(0xff00d7f3)),
                  )
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onDelete (Todo todo){
    setState(() {
      todos.remove(todo);
    });
  }
}
