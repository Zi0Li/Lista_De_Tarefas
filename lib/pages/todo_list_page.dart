import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Preço',
                  labelStyle: TextStyle(
                    fontSize: 40,
                  ),
                  hintText: 'exemplo@exemplo.com',
                  //border: InputBorder.none,
                  //errorText: 'Texto obrigatório',
                  prefixText: 'R\$',
                  suffixText: 'cm',
                ),
                //obscureText: true,
                //obscuringCharacter: 'x',
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.pink,
                ),
              ),
        ),
      ),
    );
  }
}