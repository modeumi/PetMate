import 'package:flutter/material.dart';

class QuestionToPush extends StatefulWidget {
  final String question;
  final String pushtext;
  final VoidCallback action;
  const QuestionToPush(
      {super.key,
      required this.question,
      required this.pushtext,
      required this.action});

  @override
  State<QuestionToPush> createState() => _QuestionToPushState();
}

class _QuestionToPushState extends State<QuestionToPush> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.question,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        GestureDetector(
          onTap: () {
            widget.action();
          },
          child: Container(
            padding: const EdgeInsets.only(bottom: 4),
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 3, color: Colors.white))),
            child: Text(
              widget.pushtext,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
      ],
    );
  }
}
