import 'package:custom_dropdown_button/src/App.dart';
import 'package:custom_dropdown_button/src/controller/DropdownButtonController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '커스텀 드랍다운 버튼',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      initialBinding: BindingsBuilder((){
        Get.put(DropdownButtonController());
      }),
      home: App(),
    );
  }
}

