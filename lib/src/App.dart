import 'package:custom_dropdown_button/src/components/CustomDropDownButton.dart';
import 'package:custom_dropdown_button/src/components/MyDropdownButtonWidget.dart';
import 'package:custom_dropdown_button/src/components/MyPopupMenuButtonWidget.dart';
import 'package:custom_dropdown_button/src/controller/DropdownButtonController.dart';
import 'package:custom_dropdown_button/src/pages/DefaultPage.dart';
import 'package:custom_dropdown_button/src/pages/Page1.dart';
import 'package:custom_dropdown_button/src/pages/Page2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends GetView<DropdownButtonController> {
  const App({Key? key}) : super(key: key);

  Widget myVerticalDivider(){
    return Container(
      height: 40,
      child: VerticalDivider(color: Colors.blue, thickness: 3,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("커스텀 드랍다운 버튼"),
      ),

      body: Column(
        children: [
          Row(
            children: [
              //                                   ↱ key를 통해 위치를 알 수 있음 ''
              Expanded(child: CustomDropDownButton(key: controller.dropKey,)),
              myVerticalDivider(),
              Expanded(child: MyDropdownButtonWidget()),
              myVerticalDivider(),
              Expanded(child: MyPopupMenuButtonWidget()),
            ],
          ),
          Expanded(
            child: Obx((){
              switch(controller.currentItem.value){
                case MyDropDownMenu.DEFAULT:
                  return DefaultPage();
                case MyDropDownMenu.MENU1:
                  return Page1();
                case MyDropDownMenu.MENU2:
                  return Page2();
              }
            }),
          ),
        ],
      ),
    );
  }
}
