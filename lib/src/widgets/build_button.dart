import 'package:flutter/material.dart';
import 'package:sample_app/src/utils/constants.dart';
import 'package:sample_app/src/utils/utils.dart';

class BuildButton extends StatefulWidget {
  const BuildButton({Key key, this.onPressed, this.label}) : super(key: key);
  final Function onPressed;
  final String label;

  @override
  _BuildButtonState createState() => _BuildButtonState();
}

class _BuildButtonState extends State<BuildButton> {
  int itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        width: screenWidth(context, dividedBy: 1.2),
          decoration: BoxDecoration(
            color: Gradients.colors[4],
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth(context, dividedBy: 40),
              vertical: screenHeight(context, dividedBy: 60)),
          child: Center(
            child: Text(
              widget.label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.white,
              ),
            ),
          )),
    );
  }
}
