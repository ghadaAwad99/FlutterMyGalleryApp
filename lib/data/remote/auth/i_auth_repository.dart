import 'package:my_gallery_flutter/base/api_response.dart';

abstract class IAuthRepository {
  Future<ApiResponse> loginUser({required String email, required String password});
}