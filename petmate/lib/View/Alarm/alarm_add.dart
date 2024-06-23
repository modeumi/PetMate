import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/View/Alarm/alarm_deleted.dart';
import 'package:petmate/Widget/aralam/addAralm/add_widget.dart';
import 'package:petmate/Widget/button/alarm_toggle.dart';
import 'package:petmate/Widget/bottom_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/custom_appbar.dart';

class AlarmAddPage extends StatefulWidget {
  const AlarmAddPage({super.key});

  @override
  State<AlarmAddPage> createState() => _AlarmAddPageState();
}

class _AlarmAddPageState extends State<AlarmAddPage> {
  bool state2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: 360.w,
            height: 850.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Main/Background.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Container(
                        width: 360.w,
                        height: 45.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Image.asset(
                                  'assets/alert/back.png',
                                )),
                            Container(
                              padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                              child: Text('알람',
                                  textAlign: TextAlign.center,
                                  style: White(20.sp, FontWeight.w600)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => AlarmAddPage());
                                  },
                                  child: Image.asset('assets/Main/add.png'),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => AlarmDeletedPage());
                                  },
                                  child: Image.asset(
                                      'assets/alert/delete(24).png'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.6,
                      child: Text(
                        '켜져있는 알람이 홈 화면 상단에 노출됩니다.',
                        style: White(12.sp, FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: CustomBottomNavigationBar()),
                Container(
                  color: Color(0x66303030).withOpacity(0.4),
                  width: 360.w,
                  height: 800.h,
                ),
                Positioned(top: 80, left: 7, child: AddAlarmWidget()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
