import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_connect/app/data/models/user_model.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HomeView'),
          centerTitle: true,
        ),
        body: FutureBuilder<List<User>>(
            future: controller.getAllUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.data?.length == 0) {
                return Text("Tidak ada data user");
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    //bikin variable biar ga panjang
                    User user = snapshot.data![index];

                    return ListTile(
                      title: Text("${user.firstName} ${user.lastName}"),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage("${user.avatar!}"),
                      ),
                      subtitle: Text("${user.email}"),
                    );
                  },
                );
              }
            }));
  }
}
