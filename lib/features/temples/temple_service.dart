import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:own_project/features/temples/temple_model.dart';

class TempleService {
  Future<List<TempleModel>> getTempleData() async {
    try {
      final jsonString = await rootBundle.loadString('assets/temples.json');
      return templeModelFromJson(jsonString);
    } catch (e) {
      throw e.toString();
    }
  }
}
