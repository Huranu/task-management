import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task/src/auth/application/auth_services.dart';
import 'package:task/src/auth/domain/user_model.dart';

part 'user_repo.g.dart';

class UserRepository {
  UserRepository(this.client);
  final http.Client client;

  Future<List<UserModel>> users() async {
    String token = await readData("accessToken");
    final endpoint = Uri.parse(
      'http://localhost:8000/user',
    );
    final response = await client.get(endpoint,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((e) => UserModel.fromJson(e)).toList();
    } else {
      print(
          'Failed to load users: ${response.statusCode} - ${response.reasonPhrase}');
      throw Exception('Failed to load users: ${response.reasonPhrase}');
    }
  }

  Future<List<UserModel>> taskUsers({required int taskId}) async {
    String token = await readData("accessToken");
    final endpoint = Uri.parse('http://localhost:8000/task/$taskId/users');
    final response = await client.get(endpoint,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((e) => UserModel.fromJson(e)).toList();
    } else {
      print(
          'Failed to load user: ${response.statusCode} - ${response.reasonPhrase}');
      throw Exception('Failed to load user: ${response.reasonPhrase}');
    }
  }
}

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepository(http.Client());
}

@riverpod
Future<List<UserModel>> fetchUsers(FetchUsersRef ref) {
  return ref.watch(userRepositoryProvider).users();
}

@riverpod
Future<List<UserModel>> fetchTaskUsers(
  FetchTaskUsersRef ref, {
  required int taskId,
}) {
  return ref.watch(userRepositoryProvider).taskUsers(taskId: taskId);
}
