import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_gallery_flutter/base/api_response.dart';
import 'package:my_gallery_flutter/data/local/shared_prefs_manager.dart';
import 'package:my_gallery_flutter/utils/navigation/navigation_helper.dart';
import 'package:ndialog/ndialog.dart';

import '../di/service_locator.dart';

ProgressDialog showAppLoadingDialog() {
  return showLoading(navigationKey.currentContext!);
}

void hideAppLoadingDialog(ProgressDialog? progressDialog) {
  if (progressDialog != null) dismissLoading(progressDialog);
}

ProgressDialog showLoading(BuildContext context) {
  ProgressDialog progressDialog = ProgressDialog(
    context,
    title: null,
    dismissable: true,
    defaultLoadingWidget: const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
    ),
    message: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Text("Loading"),
    ),
  );
  progressDialog.show();
  return progressDialog;
}

ProgressDialog hideLoading(BuildContext context) {
  ProgressDialog progressDialog = ProgressDialog(
    context,
    title: null,
    dismissable: false,
    defaultLoadingWidget: const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
    ),
    message: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Text("Loading"),
    ),
  );
  progressDialog.dismiss();
  return progressDialog;
}

void dismissLoading(ProgressDialog dialog) {
  dialog.dismiss();
}

showSuccessMsg({required String message}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.greenAccent,
      textColor: Colors.white,
      fontSize: 16.0);
}

void showSuccessErrorToast(ApiResponse response) {
  Fluttertoast.showToast(
      msg: response.data.result.message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

void showErrorToast({required String errorMessage}) {
  Fluttertoast.showToast(
      msg: errorMessage,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

void logOut() {
  final SharedPrefsManager sharedPrefsManager = getIt.get<SharedPrefsManager>();
  sharedPrefsManager.credentials = null;
}

//kuphal.sydni@example.org
//password