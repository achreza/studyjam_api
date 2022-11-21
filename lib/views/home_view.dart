import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:studyjam_api/controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  var controller = Get.put<HomeController>(HomeController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => MaterialApp(
          home: Scaffold(
            body: Center(
                child: controller.isFetching.value == true
                    ? CircularProgressIndicator()
                    : ListData()),
          ),
        ));
  }
}

class ListData extends StatelessWidget {
  var controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: controller.model!.data!.memes!.length,
        itemBuilder: (context, index) {
          var data = controller.model!.data!.memes![index];
          return ListTile(
            leading: Image.network(data.url.toString()),
            title: Text(data.name.toString()),
          );
        });
  }
}
