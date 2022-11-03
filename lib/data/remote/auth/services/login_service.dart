import 'package:dio/dio.dart';
import 'package:my_gallery_flutter/base/api_response.dart';
import 'package:my_gallery_flutter/base/base_service.dart';
import 'package:my_gallery_flutter/data/remote/auth/models/login_user_model.dart';
import 'package:my_gallery_flutter/utils/network/end_points.dart';
import 'package:my_gallery_flutter/utils/network/network_request.dart';

class LoginService extends BaseService {
  Future<ApiResponse> loginUser({required String email, required String password}) async {

    Map<String, dynamic> formData = {
      'email': email,
      'password': password,
    };

    final FormData data = FormData.fromMap(formData);

    NetworkRequest request = NetworkRequest(EndPoints.login, RequestMethod.post,
        data: data, dataType: RequestDataType.formData);

    var result = await networkManager.perform(request);

    if (result.status == Status.OK) {
      result.data = UserModel.fromJson(result.data);
    }
    return result;
  }
}