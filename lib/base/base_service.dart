import '../data/local/shared_prefs_manager.dart';
import '../di/service_locator.dart';
import '../utils/network/network_manager.dart';

class BaseService {

  final NetworkManager networkManager = getIt.get<NetworkManager>();
  final SharedPrefsManager sharedPrefsManager = getIt.get<SharedPrefsManager>();


  Map<String, String> get authenticatedHeaders {
    return headers..addAll({"Authorization": "Bearer ${sharedPrefsManager.accessToken ?? ''}"});
  }

  Map<String, String> get headers {
    return {"Accept": "application/json", "Content-Type": "application/json"};
  }

}