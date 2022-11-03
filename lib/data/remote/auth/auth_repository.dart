import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_gallery_flutter/base/api_response.dart';
import 'package:my_gallery_flutter/data/remote/auth/i_auth_repository.dart';
import 'package:my_gallery_flutter/data/remote/auth/services/login_service.dart';

final authRepositoryProvider = Provider<IAuthRepository>((ref) => AuthRepository());

class AuthRepository implements IAuthRepository {
  final LoginService _loginService = LoginService();

  @override
  Future<ApiResponse> loginUser({required String email, required String password}) {
    return _loginService.loginUser(email: email, password: password);
  }

}