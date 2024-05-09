import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_with_api/user/user_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  var userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(
      () {
        if (userController.isLoading.value) {
          print('api called');
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: userController.userList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: (Container(
                color: Colors.blue,
                child: ListTile(
                  trailing: Text(
                      userController.userList[index].company.bs.toString()),
                  title: Text(userController.userList[index].name),
                  subtitle: Text(
                    userController.userList[index].address.geo.lat.toString(),
                  ),
                ),
              )),
            );
          },
        );
      },
    ));
  }
}
