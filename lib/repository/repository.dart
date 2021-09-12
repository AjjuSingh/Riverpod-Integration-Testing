import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/model/todo.dart';

// Use this provider everywhere
final repositoryProvider = Provider((ref) => Repository());

// Use this link
// https://jsonplaceholder.typicode.com/todos/

class RepostoryImpl implements Repository {
  @override
  Future<List<Todo>?> fetchTodos() {
    return Future.value([
      Todo(id: '42', label: 'Hello world', completed: false),
    ]);
  }
}

class Repository {
  Future<List<Todo>?> fetchTodos() async {}
}

/// The list of todos. Here, we are simply fetching them from the server using
/// [Repository] and doing nothing else.
final todoListProvider = FutureProvider((ref) async {
  // Obtains the Repository instance
  final repository = ref.watch(repositoryProvider);

  // Fetch the todos and expose them to the UI.
  return repository.fetchTodos();
});
