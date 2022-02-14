import 'package:get/get.dart';

import '../models/user_model.dart';

class UserProvider extends GetConnect {
  //ini untuk meng get 1 user
  Future<User?> getUser(int id) async {
    final response = await get('https://reqres.in/api/users/$id');
    return User.fromJson(response.body["data"]);
  }

  //untuk membuat list user
  Future<List<User>> getAllUser() async {
    final response = await get('https://reqres.in/api/users');
    return User.fromJsonList(response.body["data"]);
  }
}
