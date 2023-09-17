import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:own_project/features/game/repository/game_repository.dart';

final gameControllerProvider = Provider((ref) {
  final gameRepository = ref.read(gameRepositoryProvider);
  return GameController(ref: ref, gameRepository: gameRepository);
});

class GameController {
  final GameRepository gameRepository;
  final ProviderRef ref;

  GameController({required this.ref, required this.gameRepository});

  Future<List<dynamic>> checkIdentity({required String predictionName}) async {
    return await gameRepository.checkIdentity(predictionName: predictionName);
  }
}
