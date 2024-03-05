import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task/src/auth/application/auth_services.dart';
import 'package:task/src/subtasks/subtask_model.dart';

part 'subtask_repo.g.dart';

class SubtaskRepository {
  SubtaskRepository(this.client);
  final http.Client client;

  Stream<List<SubtaskModel>> fetchSubtaskStream(
      {required int taskId, String? filter}) async* {
    final url =
        Uri.parse('http://localhost:8000/task/$taskId/subtasks?$filter');
    while (true) {
      try {
        final response = await http.get(url);

        if (response.statusCode == 200) {
          final List<dynamic> data = jsonDecode(response.body)['data'];
          yield data.map((e) => SubtaskModel.fromJson(e)).toList();
        } else {
          print('Error fetching items: ${response.statusCode}');
          yield [];
        }
      } catch (error) {
        print('Error making API request: $error');
        yield [];
      }
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  Stream<List<SubtaskModel>> fetchFilterdSubtaskStream(
      {required int taskId, String? filter}) async* {
    final url =
        Uri.parse('http://localhost:8000/task/$taskId/subtasks?$filter');
    while (true) {
      try {
        final response = await http.get(url);

        if (response.statusCode == 200) {
          final List<dynamic> data = jsonDecode(response.body)['data'];
          yield data.map((e) => SubtaskModel.fromJson(e)).toList();
        } else {
          print('Error fetching items: ${response.statusCode}');
          yield [];
        }
      } catch (error) {
        print('Error making API request: $error');
        yield [];
      }
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  Future<List<SubtaskModel>> subtasks(
      {required int taskId, String? filter}) async {
    final endpoint =
        Uri.parse('http://localhost:8000/task/$taskId/subtasks?$filter');
    final response = await client.get(endpoint);
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((e) => SubtaskModel.fromJson(e)).toList();
    } else {
      print(
          'Failed to load deps: ${response.statusCode} - ${response.reasonPhrase}');
      throw Exception('Failed to load deps: ${response.reasonPhrase}');
    }
  }

  Future<void> createSubtask(
      {required String title, required int taskId}) async {
    String token = await readData("accessToken");
    print(title);
    http.Response response = await client.post(
        Uri.parse('http://localhost:8000/task/$taskId/subtasks'),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: "application/json"
        },
        body: jsonEncode(<String, dynamic>{
          'status': false,
          'title': title,
        }));
    print(token);
    if (response.statusCode == 200) {
    } else {
      print(response.reasonPhrase);
      throw Exception(response);
    }
  }

  Future<void> updateSubtask(
      {required int subId, required int taskId, required bool status}) async {
    String token = await readData("accessToken");
    http.Response response = await client.put(
        Uri.parse('http://localhost:8000/task/$taskId/subtasks/$subId'),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: "application/json"
        },
        body: jsonEncode(<String, dynamic>{
          'status': status,
        }));
    if (response.statusCode == 200) {
    } else {
      print(response.reasonPhrase);
      throw Exception(response);
    }
  }
}

@riverpod
SubtaskRepository subtaskRepository(SubtaskRepositoryRef ref) {
  return SubtaskRepository(http.Client());
}

@riverpod
Future<List<SubtaskModel>> fetchSubtasks(FetchSubtasksRef ref,
    {required int taskId}) {
  return ref.watch(subtaskRepositoryProvider).subtasks(taskId: taskId);
}

final subtaskStreamProvider =
    StreamProvider.autoDispose.family<List<SubtaskModel>, int>((ref, taskId) {
  final repository = ref.read(subtaskRepositoryProvider);
  return repository.fetchSubtaskStream(taskId: taskId);
});

final subtaskFilterStreamProvider =
    StreamProvider.autoDispose.family<List<SubtaskModel>, int>((ref, taskId) {
  final repository = ref.read(subtaskRepositoryProvider);
  return repository.fetchSubtaskStream(taskId: taskId, filter: 'status=true');
});
