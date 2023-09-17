import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:own_project/features/game/model/user_gender_model.dart';

final gameRepositoryProvider = Provider((ref) => GameRepository());

class GameRepository {
  Future<List<dynamic>> checkIdentity({
    required String predictionName,
  }) async {
    try {
      http.Response res = await http.get(
        Uri.parse('https://api.genderize.io/?name=$predictionName'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          //'key': apiKey,
        },
      );
      if (jsonDecode(res.body)['gender'] != null) {
        return [true, userGenderModelFromJson(res.body)];
      } else {
        return [false];
      }
    } catch (e) {
      return [false];
    }
  }
}
