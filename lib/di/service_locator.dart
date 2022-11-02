import 'package:get_it/get_it.dart';

import '../data/local/shared_prefs_manager.dart';
import '../utils/network/network_manager.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static init() {
    initSharedPreference();
    initNetworkManager();
  }

  static Future<void> initSharedPreference() async {
    final SharedPrefsManager sharedPrefsManager = SharedPrefsManager();
    await sharedPrefsManager.init();
    getIt.registerSingleton<SharedPrefsManager>(sharedPrefsManager);
  }

  static initNetworkManager() {
    getIt.registerLazySingleton<NetworkManager>(() => NetworkManager());
  }

}