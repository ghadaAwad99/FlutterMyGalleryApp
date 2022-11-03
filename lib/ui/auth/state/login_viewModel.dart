import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_gallery_flutter/base/api_response.dart';
import 'package:my_gallery_flutter/base/response_handler.dart';
import 'package:my_gallery_flutter/data/remote/auth/auth_repository.dart';
import 'package:my_gallery_flutter/data/remote/auth/i_auth_repository.dart';
import 'package:my_gallery_flutter/ui/auth/state/login_state.dart';
import 'package:my_gallery_flutter/ui/home/home_screen.dart';
import 'package:my_gallery_flutter/utils/navigation/navigation_helper.dart';
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

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void loginUser() async {
    progressDialog = showAppLoadingDialog();
    ApiResponse response = await _authRepository.loginUser(email: usernameController.text, password: passwordController.text);
    handleResponse(
        result: response,
        onSuccess: () async {
         /*BaseService.addTokenToSF(response.data.token as String);
         BaseService.getTokenSF();
         BaseService baseService = BaseService();
         print("baseService.accessToken ${baseService.accessToken}");*/
          hideAppLoadingDialog(progressDialog);
          showSuccessMsg(message: "Logged in Successfully!");
          Navigator.pushNamedAndRemoveUntil(
              navigationKey.currentContext!, HomeScreen.tag, (_) => false);
        },
        onFailed: () {
          hideAppLoadingDialog(progressDialog);
          showErrorToast(errorMessage: "Login Failed. Try again.");
        }
      );
  }
}