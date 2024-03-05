import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task/src/workspaces/department_model.dart';

part 'department_repo.g.dart';

class DepartmentRepository {
  DepartmentRepository(this.client);
  final http.Client client;

  Future<List<DepartmentModel>> departments() async {
    final endpoint = Uri.parse('http://localhost:8000/department');
    final response = await client.get(endpoint);
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((e) => DepartmentModel.fromJson(e)).toList();
    } else {
      print(
          'Failed to load deps: ${response.statusCode} - ${response.reasonPhrase}');
      throw Exception('Failed to load deps: ${response.reasonPhrase}');
    }
  }

  Future<DepartmentModel> department({required int depId}) async {
    final endpoint = Uri.parse('http://localhost:8000/department/$depId');
    final response = await client.get(
      endpoint,
    );
    if (response.statusCode == 200) {
      final DepartmentModel data = jsonDecode(response.body)['data'];
      return data;
    } else {
      print(
          'Failed to load deps: ${response.statusCode} - ${response.reasonPhrase}');
      throw Exception('Failed to load deps: ${response.reasonPhrase}');
    }
  }
}

@riverpod
DepartmentRepository departmentRepository(DepartmentRepositoryRef ref) {
  return DepartmentRepository(http.Client());
}

@riverpod
Future<DepartmentModel> fetchDepartment(
  FetchDepartmentRef ref, {
  required int depId,
}) {
  return ref.watch(departmentRepositoryProvider).department(depId: depId);
}

@riverpod
Future<List<DepartmentModel>> fetchDepartments(FetchDepartmentsRef ref) {
  return ref.watch(departmentRepositoryProvider).departments();
}
