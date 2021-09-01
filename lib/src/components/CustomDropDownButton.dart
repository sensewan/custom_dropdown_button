import 'package:custom_dropdown_button/src/controller/DropdownButtonController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDownButton extends GetView<DropdownButtonController> {
  const CustomDropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // ↱ 클릭할 경우 페이지가 이동되지만 드랍다운 버튼 효과처럼 나오게 함
      onTap: (){
        Get.to(
          DropDownList(),
          // ↱ 뒤에 배경을 날려주는 기능..
          opaque: false,
          transition: Transition.fadeIn
        );
      },
      // ↱선택된 메뉴가 보여지도록...
      child: Obx(()=>
        Container(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "${controller.currentItem.value.getName}(커스텀)",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }
}



// 직접 만든 드랍다운 메뉴 리스트
class DropDownList extends GetView<DropdownButtonController> {
  const DropDownList({Key? key}) : super(key: key);


  Widget _dropdownList(){
    return Column(
      // ↱ 글자 부분 및 옆에 부분을 터치해도 클릭 되도록 하기 위해 사용
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children:
        MyDropDownMenu.values.map((menu) =>
          GestureDetector(
            onTap: (){
              controller.changeDropDownMenu(menu.index);
              Get.back();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              //     ↱ 선택된것 색상 변경하기
              color: controller.currentItem.value.index == menu.index ? Colors.blue[300] : Colors.white,
              child: Text(menu.getName),
            ),
          ),
        ).toList()
    );
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        child: Stack(
          children: [
            // ↱화면을 클릭할 경우 드랍다운이 닫히는 기능 (사실 페이지 이므로 Get.back를 활용함)
            Positioned(
              left: 0, right: 0, top: 0, bottom: 0,
              child: GestureDetector(
                onTap: Get.back,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),

            Positioned(
              left: 0,
              top: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)
                ),
                child: Container(
                  color: Colors.white,
                    //    ↱ _dropdownList에서 CrossAxisAlignment.stretch를 주기 위해 Container로 감싸고 width줌
                  child: Container(
                    width: Get.size.width-260,
                    child: _dropdownList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


