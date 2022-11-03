import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/local/shared_prefs_manager.dart';
import '../data/remote/auth/models/login_user_model.dart';
import '../di/service_locator.dart';
import '../utils/network/network_manager.dart';

class BaseService {

  final NetworkManager networkManager = getIt.get<NetworkManager>();

  String accessToken = '';
/*  static getSFInstance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  static addTokenToSF(String? accessToken)  async {
    SharedPreferences prefs  = await getSFInstance();
    prefs.setString(appLoginCredentialsKey, (accessToken != null)
        ? accessToken : "");
    getTokenSF();
  }

  getAccessToken()  async {
    accessToken = await getTokenSF();
  }

  static Future<String> getTokenSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString(appLoginCredentialsKey) ?? "";
    print("value $value");
    return value;
  }*/


  Map<String, String> get authenticatedHeaders {
    return headers..addAll({"Authorization": "Bearer ${accessToken ?? ''}"});
  }

  Map<String, String> get headers {
    return {"Accept": "application/json", "Content-Type": "application/json"};
  }

}