import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/button/big_save_button.dart';
import 'package:petmate/Widget/button/save_button.dart';
import 'package:petmate/Widget/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/circle_container.dart';
import 'package:petmate/Widget/custom_appbar.dart';
import 'package:petmate/Widget/custom_container.dart';
import 'package:petmate/Widget/small_container.dart';

class GetInvite extends StatefulWidget {
  const GetInvite({super.key});

  @override
  State<GetInvite> createState() => _GetInviteState();
}

class _GetInviteState extends State<GetInvite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar(
        title: '초대받기',
      ),
      body: Container(
        width: 360.w,
        height: 800.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/Main/Background.png'),
                fit: BoxFit.fill)),
        child: Stack(
          children: [
            Positioned(
              top: 106.h,
              left: 99.w,
              child: CircleContainer(
                width: 162.w,
                height: 162.h,
              ),
            ),
            Positioned(
                top: 106.h,
                left: 99.w,
                child:
                    Image.asset('assets/image_asset/invite/receive_arrow.png')),
            Positioned(
              top: 312.h,
              left: 8.w,
              child: CustomContainer(
                width: 344.w,
                height: 412.h,
              ),
            ),
            Positioned(
              top: 324.h,
              left: 20.w,
              child: Text(
                '초대코드 입력',
                style: White(14.sp, FontWeight.w600),
              ),
            ),
            Positioned(
              top: 349.h,
              left: 20.w,
              child: Text(
                '공유받은 코드를 입력해주세요',
                style: White(12.sp, FontWeight.w500),
              ),
            ),
            Positioned(
              top: 369.h,
              left: 20.w,
              child: SmallContainer(
                width: 320.w,
                height: 96.h,
              ),
            ),
            Positioned(
              top: 408.h,
              left: 32.w,
              child: Container(
                width: 296.w,
                height: 40.h,
                child: TextField(
                  textAlign: TextAlign.center,
                  scrollPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: '코드를 입력해주세요',
                    hintStyle: whiteOpacity(20.sp, FontWeight.w600),
                    enabledBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                  onSubmitted: (value) {
                    setState(() {});
                  },
                  style: TextStyle(color: Colors.white, decorationThickness: 0),
                  cursorColor: Colors.white,
                  cursorWidth: 1.w,
                ),
              ),
            ),
            Positioned(
                top: 453.h,
                left: 20.w,
                child: Container(
                  width: 296.w,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 2.w,
                              color: Colors.white.withOpacity(0.5)))),
                )),
            Positioned(
                top: 635.h,
                left: 20.w,
                child: BigSaveButton(content: '참여하기', action: () {}))
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}