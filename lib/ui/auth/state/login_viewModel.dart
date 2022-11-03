import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_gallery_flutter/base/api_response.dart';
import 'package:my_gallery_flutter/base/base_service.dart';
import 'package:my_gallery_flutter/base/response_handler.dart';
import 'package:my_gallery_flutter/data/remote/auth/auth_repository.dart';
import 'package:my_gallery_flutter/data/remote/auth/i_auth_repository.dart';
import 'package:my_gallery_flutter/data/remote/auth/models/login_user_model.dart';
import 'package:my_gallery_flutter/ui/auth/state/login_state.dart';
import 'package:my_gallery_flutter/utils/utils.dart';
import 'package:ndialog/ndialog.dart';

/*final loginViewModelProvider = StateNotifierProvider.autoDispose<LoginViewModel, LoginState>((ref) {
  return LoginViewModel(LoginState()*//*ref.watch(authRepositoryProvider)*//*);
});*/

final AutoDisposeStateNotifierProvider<LoginViewModel, LoginState> loginViewModelProvider =
StateNotifierProvider.autoDispose<LoginViewModel, LoginState>((ref) {
  return LoginViewModel(ref.watch(authRepositoryProvider));
});

class LoginViewModel extends StateNotifier<LoginState>{
  LoginViewModel(this._authRepository) : super(LoginState());
  final IAuthRepository _authRepository;
  late ProgressDialog progressDialog;



  void loginUser() async {
    progressDialog = showAppLoadingDialog();
    ApiResponse response = await _authRepository.loginUser(email: 'kuphal.sydni@example.org', password: 'password');
    handleResponse(
        result: response,
        onSuccess: () async {
         /*BaseService.addTokenToSF(response.data.token as String);
         BaseService.getTokenSF();
         BaseService baseService = BaseService();
         print("baseService.accessToken ${baseService.accessToken}");*/
          hideAppLoadingDialog(progressDialog);
          showSuccessMsg(message: "Logged in Successfully!");
        },
        onFailed: () {
          hideAppLoadingDialog(progressDialog);
          showErrorToast(errorMessage: "Login Failed. Try again.");
        }
      );
  }
}