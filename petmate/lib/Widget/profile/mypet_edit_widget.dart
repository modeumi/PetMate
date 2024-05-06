import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';

class MyPetEditWidget extends StatefulWidget {
  const MyPetEditWidget({super.key});

  @override
  State<MyPetEditWidget> createState() => _MyPetEditWidgetState();
}

class _MyPetEditWidgetState extends State<MyPetEditWidget> {
  bool state2 = false;
  final Profileimage = [
    'assets/edit/animal (1).png',
    'assets/edit/animal (2).png',
    'assets/edit/animal (3).png',
  ];

  final name = ['복실복실해', '고양고양해', '토끼토끼해'];
  final type = ['말티푸', '러시안블루', '믹스'];
  final old = ['12살', '1살', '20살'];
  final yymm = ['2021. 04. 03', '2024. 04. 03', '2013. 04. 03'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 10),
          child: Container(
            width: 90,
            height: 30,
            child: Text('내 반려동물',
                textAlign: TextAlign.center, style: White(16, FontWeight.w600)),
          ),
        ),
        for (int i = 0; i < 3; i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Stack(
              children: [
                Container(
                  width: 344,
                  height: 88,
                  margin: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: state2
                        ? Colors.white.withOpacity(0.2)
                        : Colors.transparent,
                    border: GradientBoxBorder(
                      width: 1,
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.5),
                          Colors.white.withOpacity(0.2)
                        ],
                      ),
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
                  opacity: 0.4,
                  child: Container(
                    margin: EdgeInsets.all(3),
                    width: 344,
                    height: 88,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x26000000),
                            blurRadius: 2,
                            offset: Offset(2, 2),
                            spreadRadius: 0,
                          )
                        ],
                        color: Color(0x3300287C),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Positioned(
                  left: 12,
                  top: 12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/edit/menu.png'),
                      SizedBox(
                        width: 11,
                      ),
                      Stack(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            margin: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: state2
                                  ? Colors.white.withOpacity(0.2)
                                  : Colors.white,
                              border: GradientBoxBorder(
                                width: 1,
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.white.withOpacity(0.5),
                                    Colors.white.withOpacity(0.2)
                                  ],
                                ),
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: state2
                                ? Container()
                                : BlurryContainer(
                                    blur: 12,
                                    elevation: 0,
                                    borderRadius: BorderRadius.circular(30),
                                    child: Container(),
                                  ),
                          ),
                          Opacity(
                            opacity: 0.4,
                            child: Container(
                              margin: EdgeInsets.all(2),
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x26000000),
                                      blurRadius: 2,
                                      offset: Offset(0, 2),
                                      spreadRadius: 0,
                                    )
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                          ),
                          Positioned(
                              left: 12,
                              top: 11,
                              child: Image.asset(Profileimage[i]))
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 112,
                  top: 13,
                  child: Container(
                    width: 103,
                    height: 65,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name[i],
                          style: White(14, FontWeight.w600),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              type[i],
                              style: White(12, FontWeight.w500),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Image.asset('assets/edit/Male.png'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              old[i],
                              style: White(12, FontWeight.w500),
                            ),
                            Text(
                              yymm[i],
                              style: White(12, FontWeight.w500),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}