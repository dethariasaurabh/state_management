import 'package:state_management/model/user_model.dart';
import 'package:state_management/network/api_call.dart';

class FutureBuilderController {
  Future<UserModel?> getUser() async {
    API api = API();
    UserModel? user = await api.getRandomUser();
    return user;
  }
}
