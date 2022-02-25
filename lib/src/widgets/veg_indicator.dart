import 'package:flutter/material.dart';
import 'package:sample_app/src/utils/constants.dart';
import 'package:sample_app/src/utils/utils.dart';

class VegIndicator extends StatefulWidget {
  const VegIndicator({Key key, this.vegetarian = true}) : super(key: key);
  final bool vegetarian;

  @override
  _VegIndicatorState createState() => _VegIndicatorState();
}

class _VegIndicatorState extends State<VegIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, dividedBy: 30),
      height: screenWidth(context, dividedBy: 30),
      padding: EdgeInsets.all(screenWidth(context, dividedBy: 120)),
      decoration: BoxDecoration(
          border: Border.all(
              color: widget.vegetarian == false
                  ? Gradients.colors[3]
                  : Gradients.colors[4],
              width: 0.5),
          color: widget.vegetarian == false
              ? Gradients.colors[3].withOpacity(0.1)
              : Gradients.colors[4].withOpacity(0.1)),
      child: Container(
        width: screenWidth(context, dividedBy: 30),
        height: screenWidth(context, dividedBy: 30),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.vegetarian == false
                ? Gradients.colors[3]
                : Gradients.colors[4]),
      ),
    );
  }
}
