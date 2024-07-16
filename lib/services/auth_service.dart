import 'package:recepies_app/services/http_service.dart';

import '../models/user.dart';

class AuthService {
  static final AuthService _singleton = AuthService._internal();
  final _httpService = HttpService();
  User? user;

  factory AuthService() {
    return _singleton;
  }

  AuthService._internal();
  Future<bool> login(String username, String password) async {
    try {
      var response = await _httpService
          .post("auth/login", {"username": username, "password": password});
      if (response?.statusCode == 200 && response?.data != null) {
        // print(response!.data);
        user = User.fromJson(response!.data);
        HttpService().setup(bearerToken: user!.token);
        return true;
        // print(user);
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
}
