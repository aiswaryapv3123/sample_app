import 'package:flutter/material.dart';
import 'package:sample_app/src/utils/constants.dart';
import 'package:sample_app/src/utils/utils.dart';

class CountButton extends StatefulWidget {
  const CountButton({Key key, this.color, this.onItemCountChange})
      : super(key: key);
  final ValueChanged<int> onItemCountChange;
  final Color color;

  @override
  _CountButtonState createState() => _CountButtonState();
}

class _CountButtonState extends State<CountButton> {
  int itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.color == null ? Gradients.colors[4] : widget.color,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(horizontal: screenWidth(context, dividedBy:40), vertical: screenHeight(context, dividedBy: 100)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
              onTap: () {
                setState(() {
                  if (itemCount > 0) itemCount--;
                });
                widget.onItemCountChange(itemCount);
              },
              child: Icon(
                Icons.remove,
                color: Colors.white,
              )),
          Spacer(),
          Text(
            itemCount.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 17,
              color: Colors.white,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              setState(
                    () {
                  itemCount++;
                },
              );
              widget.onItemCountChange(itemCount);
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
