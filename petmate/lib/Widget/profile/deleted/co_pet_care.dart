import 'dart:ffi';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';

class CoPetCareWidget extends StatefulWidget {
  const CoPetCareWidget({super.key});

  @override
  State<CoPetCareWidget> createState() => _CoPetCareWidgetState();
}

class _CoPetCareWidgetState extends State<CoPetCareWidget> {
  bool state = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 24,
          height: 24,
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: state
                ? Colors.white.withOpacity(0.8)
                : Colors.white.withOpacity(0.1),
            border: GradientBoxBorder(
              width: 1,
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.5),
                  Colors.white.withOpacity(0.2)
                ],
              ),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: state
              ? Container()
              : BlurryContainer(
                  blur: 12,
                  elevation: 0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(),
                ),
        ),
        Opacity(
          opacity: 0.4,
          child: Container(
            margin: EdgeInsets.all(3),
            width: 24,
            height: 24,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 1,
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  )
                ],
                color: Color(0x3300287C),
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
        Positioned(left: 7, top: 7, child: Image.asset('assets/edit/user.png')),
      ],
    );
  }
}