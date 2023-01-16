import 'dart:async';
import 'package:reactive_todo_app/database/database.dart';
import 'package:reactive_todo_app/model/games.dart';

class GameDao {
  final dbProvider = DatabaseProvider.dbProvider;

  //Adds new Todo records
  Future<int> createTodo(Game todo) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> detector;
    detector = await db.rawQuery(
        "SELECT * FROM Games WHERE id = '" + todo.id.toString() + "'");

    if (detector.length == 0) {
      var result = db.insert(todoTABLE, todo.toDatabaseJson());

      return result;
    }
  }

  //Get All Todo items
  //Searches if query string was passed
  Future<List<Game>> getTodos({List<String> columns, String query}) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;
    if (query != null) {
      if (query.isNotEmpty)
        result = await db.query(todoTABLE,
            columns: columns, where: 'title LIKE ?', whereArgs: ["%$query%"]);
    } else {
      result = await db.query(todoTABLE, columns: columns);
    }

    List<Game> todos = result.isNotEmpty
        ? result.map((item) => Game.fromDatabaseJson(item)).toList()
        : [];
    return todos;
  }

  //Update Todo record
  Future<int> updateTodo(Game todo) async {
    final db = await dbProvider.database;

    var result = await db.update(todoTABLE, todo.toDatabaseJson(),
        where: "id = ?", whereArgs: [todo.id]);

    return result;
  }

  //Delete Todo records
  Future<int> deleteTodo(int id) async {
    final db = await dbProvider.database;
    var result = await db.delete(todoTABLE, where: 'id = ?', whereArgs: [id]);

    return result;
  }

  //We are not going to use this in the demo
  Future deleteAllTodos() async {
    final db = await dbProvider.database;
    var result = await db.delete(
      todoTABLE,
    );

    return result;
  }
}
