/* Developed by: Eng Mouaz M. Al-Shahmeh */
import 'package:flutter/material.dart';
import 'package:sqfentity_example/controllers/services/orm_config.dart';

class TodoProvider extends ChangeNotifier {
  // TODO: add program with easy orm way for sql database
  // initialize data
  String? _title;
  String? _dsc;
  List<Todo?> _listTodos = [];
  Todo? _selectedTodo;
  int? _loading = 0;

  // setters
  setTitle(String val) {
    _title = val;
    notifyListeners();
  }

  setDsc(String val) {
    _dsc = val;
    notifyListeners();
  }

  selectTodo(Todo val) {
    _selectedTodo = val;
    notifyListeners();
  }

  getTodosList() async {
    _loading = 1;
    Future.delayed(const Duration(seconds: 0), () async {
      _listTodos = await Todo().select().toList();
      _loading = 0;
      notifyListeners();
      return;
    });
  }

  addToList(Todo todo) {
    Todo(title: todo.title, dsc: todo.dsc).save();
    getTodosList();
    notifyListeners();
  }

  removeFromList(int id) {
    Todo().select().id.equals(id).delete();
    getTodosList();
    notifyListeners();
  }

  updateList(Todo todo) {
    Todo(id: todo.id, title: todo.title, dsc: todo.dsc).upsert();
    getTodosList();
    notifyListeners();
  }

  // getters
  int? get loading => _loading;
  String? get title => _title;
  String? get dsc => _dsc;
  List<Todo?> get listTodos => _listTodos;
  Todo? get selectedTodo => _selectedTodo;
}
