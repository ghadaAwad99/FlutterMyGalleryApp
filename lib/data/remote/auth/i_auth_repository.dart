import 'package:my_gallery_flutter/data/remote/auth/models/login_user_model.dart';

abstract class IAuthRepository {
  Future<UserModel> loginUser({required String email, required String password});
}