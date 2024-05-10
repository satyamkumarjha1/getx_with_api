import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_with_api/user/user_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  var userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (userController.isLoading.value) {
            print('api called');
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: userController.userList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: (Container(
                  color: Colors.blue.shade100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.white24,
                          child: Text(
                              'UserName : ${userController.userList[index].username}'),
                        ),
                        Text(
                            'CompanyBS: ${userController.userList[index].company.bs.toString()}'),
                        Text('Name : ${userController.userList[index].name}'),
                        Text(
                          'Phone : ${userController.userList[index].phone.toString()}',
                        ),
                        Text(
                            'Website : ${userController.userList[index].website.toString()}')
                      ],
                    ),
                  ),
                )),
              );
            },
          );
        },
      ),
    );
  }
}
