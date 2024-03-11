import 'package:apiii/get.dart';
import 'package:apiii/login_post.dart';
import 'package:apiii/update.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter API Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ButtonScreen(),
    );
  }
}

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            ElevatedButton(
                onPressed: () {
                  Get.to(GetApi());
                },
                child: Text("Get Api")),
            ElevatedButton(
                onPressed: () {
                  Get.to(PostScreen());
                },
                child: Text("Post and Delete Api")),
            ElevatedButton(
                onPressed: () {
                  Get.to(UpdateApi());
                },
                child: Text("Update Api ")),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
