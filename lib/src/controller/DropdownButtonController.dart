import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum MyDropDownMenu{ DEFAULT, MENU1, MENU2 }

// 위에 enum을 좀더 확장하기 (스트링 값 등을 추가)
extension MyDropDownMenuExtension on MyDropDownMenu{
  // get 방식으로 사용하기
  String get getName{
    //      ↱ on으로 받은 MyDropDownMenu를 의미
    switch(this){
      case MyDropDownMenu.DEFAULT:
        return "기본메뉴";
      case MyDropDownMenu.MENU1:
        return "메뉴-1";
      case MyDropDownMenu.MENU2:
        return "메뉴-2";
    }
  }

}


class DropdownButtonController extends GetxController{

  Rx<MyDropDownMenu> currentItem = MyDropDownMenu.DEFAULT.obs;
  final dropKey = GlobalKey();

  void changeDropDownMenu(int? itemIndex){
    var selectedItem = MyDropDownMenu.values.where((menu) => menu.index == itemIndex).first;

    currentItem(selectedItem);
  }


  // custom 드랍버튼 아랫부분 위치 알아내기
  double get dropdownPositionY{
    //                       ↱ key에 해당하는 위젯을 갖고옴
    var box = dropKey.currentContext!.findRenderObject();

    //                                    ↱ null로 주면 좌표 구해짐?
    var translation = box!.getTransformTo(null).getTranslation();

    //                       ↱이동시킴
    return box.paintBounds.shift(Offset(translation.x, translation.y)).bottomCenter.dy;
    
  }

}


