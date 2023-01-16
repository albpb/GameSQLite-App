import 'package:reactive_todo_app/dao/game_dao.dart';
import 'package:reactive_todo_app/model/games.dart';
import 'package:reactive_todo_app/dao/game_dao.dart';
import 'package:dio/dio.dart';

class GameApiProvider {
  Future<List<Game>> getPendingGames() async {
    var url = "http://demo6866588.mockable.io/pendinggames";
    Response response = await Dio().get(url);
    final todoDao = GameDao();

    return (response.data as List).map((game) {
      // (x => fromJson(x))
      print('Inserting $game');
      todoDao.createTodo(Game.fromDatabaseJson(game));
    }).toList();
  }
}
