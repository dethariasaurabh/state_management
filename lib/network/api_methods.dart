import 'package:http/http.dart' as http;
import 'package:state_management/network/api_call.dart';

class APIMethods {

  static Future<http.Response> getData(String url,) {
    return http.get(Uri.parse(API.baseUrl + url),);
  }


}