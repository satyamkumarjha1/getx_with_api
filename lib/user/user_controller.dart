import 'package:get/get.dart';
import 'package:getx_with_api/Api_service.dart';
import 'package:getx_with_api/model/user_model.dart';

class UserController extends GetxController {
  var isLoading = true.obs;

  var userList = <UserModel>[].obs;

  fetchUsers() async {
    try {
      isLoading(true);

      var userData = await ApiService().fetchUserData();

      userList.addAll(userData);
    } catch (e) {
      print("error fetching user data $e");
    } finally {
      isLoading(false);
    }
  }

  void onInit() {
    fetchUsers();

    super.onInit();
  }
}
