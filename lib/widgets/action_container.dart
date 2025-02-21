import 'package:flutter/material.dart';
import 'package:ready_animate/widgets/arrow_widget.dart';

class ActionContainer extends StatelessWidget {
  const ActionContainer({
    super.key,
    required this.avatarName,
    required this.onUp,
    required this.onDown,
    required this.onLeft,
    required this.onRight,
    required this.onPlay,
    required this.onStop,
  });
  final String avatarName;
  final Function() onUp;
  final Function() onDown;
  final Function() onLeft;
  final Function() onRight;
  final Function() onPlay;
  final Function() onStop;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          avatarName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Color.fromRGBO(0, 0, 0, 0.4),
                blurRadius: 0.8,
              ),
            ],
          ),
        ),
        SizedBox(height: 4),
        ArrowWidget(
          onpressed: onUp,
          icon: Icons.arrow_upward,
        ),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ArrowWidget(
              onpressed: onLeft,
              icon: Icons.arrow_back,
            ),
            SizedBox(width: 4),
            ArrowWidget(
              onpressed: onDown,
              icon: Icons.arrow_downward,
            ),
            SizedBox(width: 4),
            ArrowWidget(
              onpressed: onRight,
              icon: Icons.arrow_forward,
            ),
          ],
        ),
        SizedBox(height: 8),
        GestureDetector(
          onTap: onPlay,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Walk',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        GestureDetector(
          onTap: onStop,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Stop',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
