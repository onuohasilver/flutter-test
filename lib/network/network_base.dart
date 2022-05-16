import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:renmoney_flutter_test/network/constants.dart';

class NetworkRequests {
  ///Generic get requests

  Future<dynamic> get(String url) async {
    http.Response response;
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': ApiConstants.bearer,
      "Sourceappid": ApiConstants.sourceID
    };
    try {
      response = await http.get(Uri.parse(url), headers: requestHeaders);
    } on SocketException {
      throw Exception('Please check your internet connection 😑');
    } on HandshakeException {
      throw Exception('Please check your internet connection 😑');
    } catch (e) {
      throw Exception(e.toString());
    }

    return response;
  }
}
