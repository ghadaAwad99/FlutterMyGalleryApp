import 'package:my_gallery_flutter/data/remote/auth/i_auth_repository.dart';
import 'package:my_gallery_flutter/data/remote/auth/models/login_user_model.dart';

class AuthRepository implements IAuthRepository {
  @override
  Future<UserModel> loginUser({required String email, required String password}) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  
}