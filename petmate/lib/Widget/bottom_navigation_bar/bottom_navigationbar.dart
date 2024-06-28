import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:petmate/Controller/navigation_controller.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/View/Community/community_main.dart';
import 'package:petmate/View/Map/naver_map.dart';
import 'package:petmate/View/MyPage/mypage.dart';
import 'package:petmate/View/mainpage.dart';

class CustomBottomNavigationBar extends GetView<BottomNavigationBarController> {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool state2 = false;

    return Obx(() => Stack(
          children: [
            Container(
              width: 360.w,
              height: 64.h,
              decoration: BoxDecoration(
                color:
                    state2 ? Colors.white.withOpacity(0.2) : Colors.transparent,
                border: Border(
                  top: BorderSide(
                      color: Colors.white.withOpacity(0.5), width: 1.w),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: state2
                  ? Container()
                  : BlurryContainer(
                      blur: 12,
                      elevation: 0,
                      borderRadius: BorderRadius.circular(10.r),
                      child: Container(),
                    ),
            ),
            Opacity(
              opacity: 0.4,
              child: Container(
                width: 360.w,
                height: 64.h,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 1,
                        offset: Offset(1, 1),
                        spreadRadius: 0,
                      )
                    ],
                    color: Color(0x3300287C),
                    borderRadius: BorderRadius.circular(10.r)),
              ),
            ),
            Container(
              width: 360.h,
              height: 62.w,
              padding: EdgeInsets.symmetric(
                horizontal: 12.h,
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                currentIndex: controller.selectedIndex.value,
                unselectedItemColor: Color(0xFFD8E3F4),
                selectedItemColor: Colors.white,
                unselectedLabelStyle: White(10.sp, FontWeight.w600),
                selectedLabelStyle: White(10.sp, FontWeight.w600),
                type: BottomNavigationBarType.fixed,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: controller.selectedIndex.value == 0
                        ? Image.asset(
                            'assets/gnbicon/home (2).png',
                            height: 30.h,
                            width: 24.w,
                          )
                        : Image.asset(
                            'assets/gnbicon/home (1).png',
                            height: 30.h,
                            width: 24.w,
                          ),
                    label: "홈",
                  ),
                  BottomNavigationBarItem(
                      icon: controller.selectedIndex.value == 1
                          ? Image.asset(
                              'assets/gnbicon/record (2).png',
                              height: 30.h,
                              width: 24.w,
                            )
                          : Image.asset(
                              'assets/gnbicon/record (1).png',
                              height: 30.h,
                              width: 24.w,
                            ),
                      label: "기록"),
                  BottomNavigationBarItem(
                    icon: controller.selectedIndex.value == 2
                        ? Image.asset(
                            'assets/gnbicon(map)/gnbicon (1).png',
                            height: 35.h,
                            width: 24.w,
                          )
                        : Image.asset(
                            'assets/gnbicon/map.png',
                            height: 35.h,
                            width: 24.w,
                          ),
                    label: "지도",
                  ),
                  BottomNavigationBarItem(
                      icon: controller.selectedIndex.value == 3
                          ? Image.asset(
                              'assets/gnbicon/chat (2).png',
                              height: 35.h,
                              width: 24.w,
                            )
                          : Image.asset(
                              'assets/gnbicon/chat (1).png',
                              height: 35.h,
                              width: 24.w,
                            ),
                      label: "커뮤니티"),
                  BottomNavigationBarItem(
                      icon: controller.selectedIndex.value == 4
                          ? Image.asset(
                              'assets/gnbicon/user (2).png',
                              height: 35.h,
                              width: 24.w,
                            )
                          : Image.asset(
                              'assets/gnbicon/user (1).png',
                              height: 35.h,
                              width: 24.w,
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
                      Get.to(() => CommunityMain());
                      break;
                    case 4:
                      Get.to(() => Mypage());
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
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}