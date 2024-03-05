import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task/src/auth/application/auth_services.dart';
import 'package:task/src/tasks/domain/task_model.dart';

part 'task_repo.g.dart';

class TaskRepository {
  TaskRepository(this.client);
  final http.Client client;

  Stream<List<TaskModel>> tasks({String? filter}) async* {
    while (true) {
      String token = await readData("accessToken");
      final endpoint = Uri.parse('http://localhost:8000/task/?$filter');
      final response = await client.get(endpoint,
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['data'];
        yield data.map((e) => TaskModel.fromJson(e)).toList();
      } else {
        print(
            'Failed to load deps: ${response.statusCode} - ${response.reasonPhrase}');
        throw Exception('Failed to load deps: ${response.reasonPhrase}');
      }
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  Future<TaskModel> task({required int taskId}) async {
    String token = await readData("accessToken");
    final endpoint = Uri.parse('http://localhost:8000/task/$taskId');
    final response = await client.get(endpoint,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      return TaskModel.fromJson(data);
    } else {
      print(
          'Failed to load task: ${response.statusCode} - ${response.reasonPhrase}');
      throw Exception('Failed to load task: ${response.reasonPhrase}');
    }
  }

  Stream<List<TaskModel>> getDepTasks({required int depId}) async* {
    try {
      String token = await readData("accessToken");
      final response = await http.get(
          Uri.parse("http://localhost:8000/department/$depId/tasks"),
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['data'];
        yield data.map((e) => TaskModel.fromJson(e)).toList();
      } else {
        print(
            'Failed to load tasks: ${response.statusCode} - ${response.reasonPhrase}');
        throw Exception('Failed to load tasks: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error in getTasks: $e');
      throw Exception('Error in getTasks: $e');
    }
  }

  Future<void> createTaskRepository(
      {required String title,
      required String description,
      required String stage,
      required int weight,
      required String dueDate,
      required String startDate,
      required List users,
      required List deps}) async {
    String token = await readData("accessToken");
    http.Response response = await http.post(
      Uri.parse("http://localhost:8000/task"),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.contentTypeHeader: "application/json"
      },
      body: jsonEncode({
        "title": title,
        "description": description,
        "weight": weight,
        "start_date": startDate,
        "due_date": dueDate,
        "stage": stage,
        "owner_id": null,
        "project_id": null,
        "milestone_id": null,
        "sprint_id": null,
        "users": users,
        "deps": deps
      }),
    );
    if (response.statusCode == 200) {
    } else {
      print(response.reasonPhrase);
      throw Exception(response);
    }
  }

  Future<List<TaskModel>> filterTaskData({required String s}) async {
    String token = await readData("accessToken");
    try {
      final response = await http.get(
          Uri.parse('http://localhost:8000/task?$s'),
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['data'];
        return data.map((e) => TaskModel.fromJson(e)).toList();
      } else {
        print(
            'Failed to load tasks: ${response.statusCode} - ${response.reasonPhrase}');
        throw Exception('Failed to load task: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error in getTasks: $e');
      throw Exception('Error in getTasks: $e');
    }
  }

  Future<bool> deleteTask({
    required int taskId,
  }) async {
    String token = await readData("accessToken");
    http.Response response = await http.delete(
      Uri.parse("http://localhost:8000/task/$taskId"),
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      print(response.reasonPhrase);
      throw Exception(response);
    }
  }
}

@riverpod
TaskRepository taskRepository(TaskRepositoryRef ref) {
  return TaskRepository(http.Client());
}

@riverpod
Future<TaskModel> fetchTask(
  FetchTaskRef ref, {
  required int taskId,
}) {
  return ref.watch(taskRepositoryProvider).task(taskId: taskId);
}

@riverpod
Future<List<TaskModel>> filterTasks(
  FilterTasksRef ref, {
  required String filter,
}) {
  return ref.watch(taskRepositoryProvider).filterTaskData(s: filter);
}

final taskStreamProvider =
    StreamProvider.autoDispose.family<List<TaskModel>, String>((ref, filter) {
  final repository = ref.read(taskRepositoryProvider);
  return repository.tasks(filter: filter);
});

final depTaskStreamProvider =
    StreamProvider.autoDispose.family<List<TaskModel>, int>((ref, depId) {
  final repository = ref.read(taskRepositoryProvider);
  return repository.getDepTasks(depId: depId);
});
