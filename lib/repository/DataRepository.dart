
import 'package:sample_flutter_app/models/ToDoItem.dart';

abstract class DataRepository {

  Future<List<ToDoItem>> getAll();

  Future<ToDoItem> get(int id);

  Future<bool> remove(int id);

  Future<int> add(ToDoItem item);

  Future<bool> put(int id, ToDoItem item);

  Future<void> closeRepo();
}