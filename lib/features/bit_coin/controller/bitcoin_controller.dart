import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:own_project/features/bit_coin/repository/bit_coin_repository.dart';

import '../../../models/bit_coin_model.dart';

final bitCoinControllerProvider = Provider((ref) {
  final bitCoinRepository = ref.watch(bitcoinRepositoryProvider);
  return BitCoinController(bitCoinRepository: bitCoinRepository, ref: ref);
});

final bitDatProvider = FutureProvider((ref) {
  final bitController = ref.watch(bitCoinControllerProvider);
  return bitController.getBitCoinData();
});

class BitCoinController {
  final BitCoinRepository bitCoinRepository;
  final ProviderRef ref;

  BitCoinController({
    required this.bitCoinRepository,
    required this.ref,
  });

  Future<List<BitCoinModel>> getBitCoinData() {
    return bitCoinRepository.getBitCoinData();
  }

  // void getBitCoinData() {
  //    bitCoinRepository.getBitCoinData();
  // }


}
