import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:own_project/features/users/model/user_model.dart';

final userRepository = Provider((ref) => UserRepository());

class UserRepository {
  String userUrl = "https://jsonplaceholder.typicode.com/users/10";

  Future<UserModel> getBitCoinData() async {
    List<UserModel> userData = [];
    try {
      http.Response res = await http.get(Uri.parse(userUrl), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });
      if (res.statusCode == 200) {
        userData.add(userModelFromJson(res.body));
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return userData[0];
  }
}
