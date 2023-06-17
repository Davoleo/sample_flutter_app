import 'package:sample_flutter_app/models/ToDoItem.dart';
import 'package:sample_flutter_app/repository/DBProvider.dart';
import 'package:sample_flutter_app/repository/DataRepository.dart';
import 'package:sqflite/sqflite.dart';

class SQLRepository extends DataRepository {

  DBProvider _dbProvider;

  SQLRepository() : _dbProvider = DBProvider.instance;

  @override
  Future<int> add(ToDoItem item) async {
    Database database = await _dbProvider.database;
    var id = await database.insert("TodoList", item.toJson());
    item.id = id;
    return id;
  }

  //RAW INSERT
//    Database database = await _dbProvider.database;
//    var id = await database.rawInsert(
//      "INSERT INTO TodoList (title, description, done) "
//          "VALUES ('${item.title}', '${item.description}', '${item.done}')");
//    return id;

  @override
  Future<void> closeRepo() {
    return _dbProvider.close();
  }

  @override
  Future<ToDoItem?> get(int id) async {
    Database database = await _dbProvider.database;
    var maps = await database.query("TodoList", where: "$id = ?", whereArgs: [id]);

    if (maps.isNotEmpty)
      return ToDoItem.fromJson(maps.first);
    else
      return null;
  }

  @override
  Future<List<ToDoItem>> getAll() async {
    Database database = await _dbProvider.database;

    List<Map<String, dynamic>> data = await database.query("TodoList");

    //Map the database Key value pairs to our ToDoItem Model
    List<ToDoItem> items = data.map<ToDoItem>((item) => ToDoItem.fromJson(item)).toList();

    return items;
  }

  @override
  Future<bool> put(int id, ToDoItem item) async {
    Database database = await _dbProvider.database;

    int count = await database.update("TodoList", item.toJson(), where: "id = $id");
    return count == 1;
  }

  @override
  Future<bool> remove(int id) async {
    Database database = await _dbProvider.database;

    int count = await database.delete("TodoList", where: "id = $id");
    return count == 1;
  }

}