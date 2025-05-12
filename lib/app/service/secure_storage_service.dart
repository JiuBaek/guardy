import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

class SecureStorageService {
  static SecureStorageService get I => GetIt.I<SecureStorageService>();

  late final FlutterSecureStorage secureStorage;

  Future<String?> get accessToken => secureStorage.read(key: "jwtAccessToken");

  void init() {
    secureStorage = const FlutterSecureStorage();
  }

  Future<void> saveTokens(String accessToken) async {
    await Future.wait([
      secureStorage.write(key: "jwtAccessToken", value: accessToken),
    ]);
  }

  Future<void> clearTokens() async {
    await secureStorage.delete(key: "jwtAccessToken");
  }

  Future<void> deleteAll() async {
    await secureStorage.deleteAll();
  }
}
