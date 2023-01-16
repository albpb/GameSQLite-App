import 'package:reactive_todo_app/dao/game_dao.dart';
import 'package:reactive_todo_app/model/games.dart';

class TodoRepository {
  final todoDao = GameDao();

  Future getAllTodos({String query}) => todoDao.getTodos(query: query);

  Future insertTodo(Game todo) => todoDao.createTodo(todo);

  Future updateTodo(Game todo) => todoDao.updateTodo(todo);

  Future deleteTodoById(int id) => todoDao.deleteTodo(id);

  //We are not going to use this in the demo
  Future deleteAllTodos() => todoDao.deleteAllTodos();
}
