import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task/src/auth/application/auth_services.dart';
import 'package:task/src/milestones/milestone_model.dart';

part 'milestone_repo.g.dart';

class MilestoneRepository {
  MilestoneRepository(this.client);
  final http.Client client;

  Future<List<MilestoneModel>> getProjectMilestones(
      {required int proId}) async {
    try {
      String token = await readData("accessToken");
      final response = await http.get(
          Uri.parse("http://localhost:8000/project/$proId/milestones"),
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['data'];
        return data.map((e) => MilestoneModel.fromJson(e)).toList();
      } else {
        print(
            'Failed to load milestones: ${response.statusCode} - ${response.reasonPhrase}');
        throw Exception('Failed to load milestones: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error in getProjectMilestones: $e');
      throw Exception('Error in getProjectMilestones: $e');
    }
  }

  Future<MilestoneModel> milestone({required int mileId}) async {
    final endpoint = Uri.parse('http://localhost:8000/milestone/$mileId');
    final response = await client.get(endpoint);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data']['project'];
      return MilestoneModel.fromJson(data);
    } else {
      print(
          'Failed to load deps: ${response.statusCode} - ${response.reasonPhrase}');
      throw Exception('Failed to load deps: ${response.reasonPhrase}');
    }
  }
}

@riverpod
MilestoneRepository milestoneRepository(MilestoneRepositoryRef ref) {
  return MilestoneRepository(http.Client());
}

@riverpod
Future<MilestoneModel> fetchMilestone(
  FetchMilestoneRef ref, {
  required int mileId,
}) {
  return ref.watch(milestoneRepositoryProvider).milestone(mileId: mileId);
}

@riverpod
Future<List<MilestoneModel>> fetchProjectMilestones(
    FetchProjectMilestonesRef ref,
    {required int proId}) {
  return ref
      .watch(milestoneRepositoryProvider)
      .getProjectMilestones(proId: proId);
}
