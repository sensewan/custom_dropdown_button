import 'package:get/get.dart';

enum MyDropDownMenu{ DEFAULT, MENU1, MENU2 }

// 위에 enum을 좀더 확장하기 (스트링 값 등을 추가)
extension MyDropDownMenuExtension on MyDropDownMenu{
  // get 방식으로 사용하기
  String get getName{
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

  void changeDropDownMenu(int? itemIndex){
    var selectedItem = MyDropDownMenu.values.where((menu) => menu.index == itemIndex).first;

    currentItem(selectedItem);
  }

}