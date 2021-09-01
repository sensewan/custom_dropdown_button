import 'package:custom_dropdown_button/src/controller/DropdownButtonController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPopupMenuButtonWidget extends GetView<DropdownButtonController> {
  const MyPopupMenuButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      // ↱팝업 나오는 위치 변경하기
      offset: Offset(0, 45),
      elevation: 0,
      // ↱라운드 주기      ↱ a:from, b:to, t: 0이면 a - 1이면 b따라감 (0.5 이렇게도 가능)
      shape: ShapeBorder.lerp(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          0
      ),
      onSelected: (int selectIndex){
        controller.changeDropDownMenu(selectIndex);
      },
      itemBuilder: (BuildContext context){
        return MyDropDownMenu.values.map((menu) =>
          PopupMenuItem(
            value: menu.index,
            child: Text("${menu.getName} (팝업)"),
          ),
        ).toList();
      },

      // ↱선택되었을 때의 기본 메뉴 아이콘 및 텍스트 (안 하면 ... 이렇게 보임)
      child: Obx(()=>
        Container(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "${controller.currentItem.value.getName}(팝업)",
                  style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                ),
              ),
              Icon(Icons.arrow_drop_down)
            ],
          ),
        ),
      ),
    );
  }
}
