import 'package:get/get.dart';

//import userprovider sama modelnya
import '../../../data/providers/user_provider.dart';
import '../../../data/models/user_model.dart';

class HomeController extends GetxController {
  UserProvider userProvider = UserProvider();

//ini fungsi untuk mengambil 1
  Future<User?> getSingleUser(int id) async {
    return await userProvider.getUser(id);
  }

  //ini untuk mengambil list dari sebuah user

  Future<List<User>> getAllUser() async {
    return await userProvider.getAllUser();
  }
}
