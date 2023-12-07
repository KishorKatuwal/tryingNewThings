import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:own_project/features/real_time_crypto/crypto_repository.dart';

final cryptoControllerProvider = Provider((ref){
  final cryptoRepository = ref.watch(cryptoRepositoryProvider);
  return CryptoController(cryptoRepository: cryptoRepository, ref: ref);
});

class CryptoController {
  final ProviderRef ref;
  final CryptoRepository cryptoRepository;

  CryptoController({required this.ref, required this.cryptoRepository});
}
