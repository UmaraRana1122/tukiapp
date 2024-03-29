import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../controllers/auth_controller.dart';
import 'api_exceptions.dart';
import 'api_urls.dart';

// This is the DataApiService class. It contains two methods, get and post, to access the api
// for both information retrieval and data updates. There is also a helper method named _processResponse
// which determines which response to send based on the response code received from the api.
class DataApiService {
  DataApiService._();

  // Stores timeout duration needed for api calls
  // ignore: constant_identifier_names
  static const int TIME_OUT_DURATION = 9990;

  AuthController authController = Get.find();

  static final DataApiService _instance = DataApiService._();

  static DataApiService get instance => _instance;

  //GET
  Future<dynamic> get(String api) async {
    var uri = Uri.parse(BASE_URL + api);
    try {
      http.Response response = await http.get(uri, headers: {
        'Cookie':
            'auth_session=PBSVxW%2B5zYKY6Rl2dvLQRp3eU%2F6oaoylmcGocc7nSKE1ENXgDIhOEzUwqVO3bvPGZewnr2dPSq6wdVbmQ4ucjRanz32zytqAoNNIHUsPmCOxlifC6XrBrdrHxCA426CXEnyhda%2BZAfFJHOCDU9yzS9B3020twp2RZslgEWZ7rOcYgvnD%2BNRXIUcewSUopeiou%2BxD3bAhqnyU9na8kw6758uLE1U%2Bz1nx3dJUXffXsfKrQnQsJj4vcHHqcCayVVTfPL2%2Fe96grpKWi0AjPoKFy5XVXNHxyk1us%2Bx%2Bz%2BX%2BP3PME6V6ppqpwx%2FhFkTtQ%2Fn2qRhY%2Bnq1rodEIKkutx7c%2Fj7H2lMhIBSX4yoMG5h8QUQ%3D--ZmsnBqdaKP4fPz6y--GkfSbW5NcCxFryRvlooRhA%3D%3D'
      }).timeout(const Duration(seconds: TIME_OUT_DURATION));
      // return response;
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //POST
  Future<dynamic> post(String api, dynamic body) async {
    var uri = Uri.parse(BASE_URL + api);
    try {
      http.Response response = await http
          .post(
            uri,
            headers: {
              "Authorization": "Bearer ${authController.token.value}",
            },
            body: body,
          )
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return response;
      // return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //MultiPartRequest
  Future<dynamic> multiPartPost(String api, String? imageFile, body) async {
    var uri = Uri.parse(BASE_URL + api);
    try {
      var headers = {'Authorization': 'Bearer ${authController.token}'};
      var request = http.MultipartRequest(
          'POST', Uri.parse('http://bluej.beckapps.co/api/edit-profile'));
      if (imageFile != null) {
        request.files
            .add(await http.MultipartFile.fromPath('image', imageFile));
      }
      request.fields.addAll(body);
      request.headers.addAll(headers);

      http.StreamedResponse response = await request
          .send()
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      final respStr = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        return respStr;
      } else {
        print(response.reasonPhrase);
        return respStr;
      }
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  // Helper method that determines response based on response code
  dynamic _processResponse(http.Response response) {
    var responseJson = utf8.decode(response.bodyBytes);
    switch (response.statusCode) {
      case 200:
        return responseJson;
      case 201:
        return responseJson;
      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 422:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred with code : ${response.statusCode}',
            response.request!.url.toString());
    }
  }
}
