import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task/src/auth/application/auth_services.dart';
import 'package:task/src/projects/project_model.dart';

part 'project_repo.g.dart';

class ProjectRepository {
  ProjectRepository(this.client);
  final http.Client client;

  Future<List<ProjectModel>> projects() async {
    final endpoint = Uri.parse('http://localhost:8000/project');
    final response = await client.get(endpoint);
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((e) => ProjectModel.fromJson(e)).toList();
    } else {
      print(
          'Failed to load deps: ${response.statusCode} - ${response.reasonPhrase}');
      throw Exception('Failed to load deps: ${response.reasonPhrase}');
    }
  }

  Stream<List<ProjectModel>> getDepProjects({required int depId}) async* {
    try {
      String token = await readData("accessToken");
      final response = await http.get(
          Uri.parse("http://localhost:8000/department/$depId/projects"),
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['data'];
        yield data.map((e) => ProjectModel.fromJson(e)).toList();
      } else {
        print(
            'Failed to load projects: ${response.statusCode} - ${response.reasonPhrase}');
        throw Exception('Failed to load projects: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error in getDepProjects: $e');
      throw Exception('Error in getDepProjects: $e');
    }
  }

  Future<ProjectModel> project({required int proId}) async {
    final endpoint = Uri.parse('http://localhost:8000/project/$proId');
    final response = await client.get(endpoint);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data']['project'];
      return ProjectModel.fromJson(data);
    } else {
      print(
          'Failed to load deps: ${response.statusCode} - ${response.reasonPhrase}');
      throw Exception('Failed to load deps: ${response.reasonPhrase}');
    }
  }
}

@riverpod
ProjectRepository projectRepository(ProjectRepositoryRef ref) {
  return ProjectRepository(http.Client());
}

@riverpod
Future<ProjectModel> fetchProject(
  FetchProjectRef ref, {
  required int proId,
}) {
  return ref.watch(projectRepositoryProvider).project(proId: proId);
}

final projectStreamProvider =
    StreamProvider.autoDispose.family<List<ProjectModel>, int>((ref, depId) {
  final repository = ref.read(projectRepositoryProvider);
  return repository.getDepProjects(depId: depId);
});

@riverpod
Future<List<ProjectModel>> fetchProjects(FetchProjectsRef ref) {
  return ref.watch(projectRepositoryProvider).projects();
}
