import 'dart:convert';

import 'package:state_management/model/user_model.dart';
import 'package:state_management/network/api_methods.dart';

class API {
  static const String baseUrl = 'https://random-data-api.com/api/';

  Future<UserModel?> getRandomUser() async {
    final response = await APIMethods.getData('bank/random_bank');

    if (response.statusCode == 200) {
      return UserModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      return null;
    }
  }
}
