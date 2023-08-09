// ignore_for_file: unused_local_variable, constant_identifier_names
import 'dart:convert';
import 'dart:io';
import 'package:flutterproject/Widgets/overlays/custom_dialog.dart';
import 'package:flutterproject/backend/models/base_model.dart';
import 'package:flutterproject/constants/globals.dart';
import 'package:flutterproject/constants/texts.dart';
import 'package:flutterproject/constants/url.dart';
import 'package:flutterproject/helpers/logs.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

const String POST = 'POST';
const String GET = 'GET';
const String DEL = 'DEL';
const String PATCH = 'PATCH';
const String PUT = 'PUT';
const String UPDATE = "UPDATE";
const String DELETE = "DELETE";

Future api(
  String method,
  String? url, {
  String? queryParam,
  var data,
  bool showLoader = false,
  bool isJson = false,
  bool showSuccessMessage = false,
  bool showToast = true,
  bool isMultiparRequest = false,
  File? file,
  String? fileKey,
}) async {
  // final connectivityResult = await Connectivity().checkConnectivity();
//   if (connectivityResult == ConnectivityResult.none) {
//  //   showSnackBar('No internet connection');
//     return null;
//   }
  try {
    if (showLoader) CustomDialogs.showLoading();
    if (url != null && queryParam != null) {
      url = url + queryParam;
    }
    Uri uri = Uri.parse('${AppUrls.baseUrl}$url');
    appLogs('$method Url: ${uri.path}');
    appLogs('Api Request Body $data');
    Map<String, String> headers = _getHeaders(method, isJson: isJson);
    http.BaseRequest request;
    Object? jsonData;
    if (isJson) {
      jsonData = json.encode(data);
    } else {
      jsonData = data;
    }
    if (isMultiparRequest == true) {
      request = await multipartRequest(method, uri,
          data: data, file: file, fileKey: fileKey);
    } else {
      request = await jsonRequest(method, uri, data: data);
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    String? responseData = await response.stream.bytesToString();
    appLogs("statusCode: ${response.statusCode}");
    appLogs("Response $url: $responseData");
    final decodedResponse = json.decode(responseData);
    if (response.statusCode != 200) appLogs("Response $url: $decodedResponse");
    if (response.statusCode == 401) {
      if (showLoader) CustomDialogs.dismiss();
      CustomDialogs.showToast(message: AppTexts.sessionExpiredLoginAgain);
      //Get.offAll(const LoginPage());
      return null;
    }
    BaseModel body = BaseModel.fromJson(decodedResponse);
    if (showLoader) CustomDialogs.dismiss();
    if (response.statusCode == 200 && body.status == true) {
      if (showSuccessMessage) {
        CustomDialogs.showToast(
            message: body.message, isSuccess: showSuccessMessage);
      }
      return body.data ?? body.status;
    } else {
      if (showToast) {
        CustomDialogs.showToast(message: body.message);
      }
    }
    return null;
  } catch (err) {
    appLogs('error: $err');
    if (showLoader) CustomDialogs.dismiss();
    if (showToast) {
      CustomDialogs.showToast(message: AppTexts.somethingWentWrong);
    }
    return null;
  }
}

Map<String, String> _getHeaders(String? method, {bool isJson = false}) {
  Map<String, String> headers = {};
  String? token = "Bearer ${AppGlobals.user?.token}";
  appLogs("token: $token");
  headers["Content-Type"] =
      isJson ? "application/json" : "application/x-www-form-urlencoded";
  if (AppGlobals.user?.token != null && AppGlobals.user?.token != "") {
    headers["Authorization"] = token;
  }
  return headers;
}

Future<MultipartRequest> multipartRequest(String method, Uri uri,
    {var data, File? file, String? fileKey}) async {
  var request = http.MultipartRequest(method, uri);
  request.fields.addAll(data ?? {});
  if (file != null && file.path.isNotEmpty) {
    http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath(fileKey ?? "", file.path);
    request.files.add(multipartFile);
  }
  return request;
}

Future<Request> jsonRequest(String method, Uri uri, {var data}) async {
  var request = http.Request(method, uri);
  request.body = jsonEncode(data);
  return request;
}

Future uploadImageApi(String url, {File? file}) async {
  try {
    CustomDialogs.showLoading();
    http.MultipartRequest? request =
        http.MultipartRequest(PATCH, Uri.parse(url));
    request.headers.addAll(_getHeaders(PATCH));
    if (file != null && file.path.isNotEmpty) {
      http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath('profile_image', file.path);
      request.files.add(multipartFile);
    }
    http.StreamedResponse response = await request.send();
    String bytesString = await response.stream.bytesToString();
    var result = json.decode(bytesString);
    return null;
  } catch (err) {
    appLogs('error: $err');
    CustomDialogs.dismiss();
    CustomDialogs.showToast(message: AppTexts.somethingWentWrong);
    return null;
  }
}
