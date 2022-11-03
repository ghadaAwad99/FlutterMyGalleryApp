import 'package:my_gallery_flutter/base/api_response.dart';

Future<void> handleResponse(
    {required ApiResponse result,
    Function? onSuccess,
    Function? onFailed}) async {
  if (result.status == Status.OK) {
    await onSuccess?.call();
  } else if (result.status == Status.FAILED) {
    onFailed?.call();
  }
  return Future.value();
}

