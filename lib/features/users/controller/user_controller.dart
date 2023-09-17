import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user_model.dart';
import '../repository/user_repository.dart';

final userControllerProvider = Provider((ref) {
  final userRepository = UserRepository();
  return UserController(userRepository: userRepository, ref: ref);
});

class UserController {
  final UserRepository userRepository;
  final ProviderRef ref;

  UserController({required this.userRepository, required this.ref});

  Future<UserModel> getUserData() {
    return userRepository.getBitCoinData();
  }
}
