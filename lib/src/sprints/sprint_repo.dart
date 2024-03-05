import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task/src/auth/application/auth_services.dart';
import 'package:task/src/sprints/sprint_model.dart';

part 'sprint_repo.g.dart';

class SprintRepository {
  SprintRepository(this.client);
  final http.Client client;

  Future<List<SprintModel>> getProjectSprints({required int proId}) async {
    try {
      String token = await readData("accessToken");
      final response = await http.get(
          Uri.parse("http://localhost:8000/project/$proId/sprints"),
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['data'];
        return data.map((e) => SprintModel.fromJson(e)).toList();
      } else {
        print(
            'Failed to load sprints: ${response.statusCode} - ${response.reasonPhrase}');
        throw Exception('Failed to load sprints: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error in getProjectSprints: $e');
      throw Exception('Error in getProjectSprints: $e');
    }
  }

  Future<SprintModel> sprint({required int sprintId}) async {
    final endpoint = Uri.parse('http://localhost:8000/sprint/$sprintId');
    final response = await client.get(endpoint);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data']['project'];
      return SprintModel.fromJson(data);
    } else {
      print(
          'Failed to load deps: ${response.statusCode} - ${response.reasonPhrase}');
      throw Exception('Failed to load deps: ${response.reasonPhrase}');
    }
  }
}

@riverpod
SprintRepository sprintRepository(SprintRepositoryRef ref) {
  return SprintRepository(http.Client());
}

@riverpod
Future<SprintModel> fetchSprint(
  FetchSprintRef ref, {
  required int sprintId,
}) {
  return ref.watch(sprintRepositoryProvider).sprint(sprintId: sprintId);
}

@riverpod
Future<List<SprintModel>> fetchProjectSprints(
  FetchProjectSprintsRef ref, {
  required int proId,
}) {
  return ref.watch(sprintRepositoryProvider).getProjectSprints(proId: proId);
}
