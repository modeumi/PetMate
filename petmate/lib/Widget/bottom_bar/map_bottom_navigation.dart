import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:petmate/Controller/navigation_controller.dart';
import 'package:petmate/View/Map/naver_map.dart';
import 'package:petmate/View/mainpage.dart';

class MapBottomNavigationBar extends GetView<BottomNavigationBarController> {
  const MapBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool state2 = false;

    return Obx(() => Stack(
          children: [
            Container(
              width: double.infinity,
              height: 64,
              decoration: BoxDecoration(
                color: state2
                    ? Colors.white.withOpacity(0.2)
                    : Colors.white.withOpacity(0.20000000298023224),
                border: Border(
                  top: BorderSide(
                      color: Colors.white.withOpacity(0.20000000298023224),
                      width: 1),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: state2
                  ? Container()
                  : BlurryContainer(
                      blur: 12,
                      elevation: 0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(),
                    ),
            ),
            Opacity(
              opacity: 0.2,
              child: Container(
                width: double.infinity,
                height: 64,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 2,
                        offset: Offset(2, 2),
                        spreadRadius: 0,
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Container(
              width: 350,
              height: 65,
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                currentIndex: controller.selectedIndex.value,
                unselectedItemColor: Color(0xFFB7B7B7),
                selectedItemColor: Color(0xFF5A8FE1),
                unselectedLabelStyle: TextStyle(
                  fontFamily: 'Pretendard',
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                selectedLabelStyle: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                type: BottomNavigationBarType.fixed,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: controller.selectedIndex.value == 0
                        ? Image.asset(
                            'assets/gnbicon/home (2).png',
                            height: 30,
                            width: 24,
                          )
                        : Image.asset(
                            'assets/gnbicon(map)/gnbicon (4).png',
                            height: 30,
                            width: 24,
                          ),
                    label: "홈",
                  ),
                  BottomNavigationBarItem(
                      icon: controller.selectedIndex.value == 1
                          ? Image.asset(
                              'assets/gnbicon/record (2).png',
                              height: 30,
                              width: 24,
                            )
                          : Image.asset(
                              'assets/gnbicon(map)/gnbicon (5).png',
                              height: 30,
                              width: 24,
                            ),
                      label: "기록"),
                  BottomNavigationBarItem(
                      icon: controller.selectedIndex.value == 2
                          ? Image.asset(
                              'assets/gnbicon(map)/gnbicon (1).png',
                              height: 30,
                              width: 24,
                            )
                          : Image.asset(
                              'assets/gnbicon/map.png',
                              height: 30,
                              width: 24,
                            ),
                      label: "지도"),
                  BottomNavigationBarItem(
                      icon: controller.selectedIndex.value == 3
                          ? Image.asset(
                              'assets/gnbicon/chat (2).png',
                              height: 30,
                              width: 24,
                            )
                          : Image.asset(
                              'assets/gnbicon(map)/gnbicon (3).png',
                              height: 30,
                              width: 24,
                            ),
                      label: "커뮤니티"),
                  BottomNavigationBarItem(
                      icon: controller.selectedIndex.value == 4
                          ? Image.asset(
                              'assets/gnbicon/user (2).png',
                              height: 30,
                              width: 24,
                            )
                          : Image.asset(
                              'assets/gnbicon(map)/gnbicon (2).png',
                              height: 30,
                              width: 24,
                            ),
                      label: "마이페이지"),
                ],
                onTap: (index) {
                  controller.changeIndex(index);
                  switch (index) {
                    case 0:
                      Get.to(() => MainPage());
                      break;
                    case 1:
                      // Get.to(() => Log());
                      break;
                    case 2:
                      Get.to(() => MNaverMap());
                      break;
                    case 3:
                      // Get.to(() => Community());
                      break;
                    case 4:
                      // Get.to(() => MyPage());
                      break;
                    default:
                  }
                },
              ),
            ),
          ],
        ));
  }
}

class BottomWidget extends StatelessWidget {
  static List<Widget> tabPages = <Widget>[MainPage(), MNaverMap()];

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavigationBarController());
    return Scaffold(
      body: Obx(() => SafeArea(
          child:
              tabPages[BottomNavigationBarController.to.selectedIndex.value])),
      bottomNavigationBar: MapBottomNavigationBar(),
    );
  }
}