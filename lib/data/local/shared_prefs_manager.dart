import 'dart:convert';
import 'package:my_gallery_flutter/data/remote/auth/models/login_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsManager {
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    return;
  }

  SharedPreferences? prefs;

  UserModel? get credentials {
    var loginString = prefs?.getString(appLoginCredentialsKey) ?? "";
    if (loginString.isNotEmpty) {
      return UserModel.fromJson(json.decode(loginString));
    } else {
      return null;
    }
  }

  set credentials(UserModel? loginResponseEntity) {
    prefs?.setString(appLoginCredentialsKey, (loginResponseEntity != null)
            ? json.encode(loginResponseEntity.toJson()) : "");
  }

  String? get accessToken {
    if (credentials != null) {
      return credentials!.token;
    }
    return null;
  }

  int? get userId {
    return credentials!.user?.id;
  }
}

const String appLoginCredentialsKey = "appLoginCredentialsKey";
const String token = "token";
const String uid = "uid";