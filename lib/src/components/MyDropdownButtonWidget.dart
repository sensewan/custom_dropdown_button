import 'package:custom_dropdown_button/src/controller/DropdownButtonController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDropdownButtonWidget extends GetView<DropdownButtonController> {
  const MyDropdownButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=>DropdownButton(
      value: controller.currentItem.value.index,
      onChanged: (int? value){
        controller.changeDropDownMenu(value!);
      },
      items:
        MyDropDownMenu.values.map((menu) =>
          DropdownMenuItem(
            // ↱ 각 드랍버튼 메뉴의 고유 key 값이라고 생각하면 됨..
            value: menu.index,
            child: Text(
              "${menu.getName}(기본형)",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
        ).toList(),
    ),);
  }
}
