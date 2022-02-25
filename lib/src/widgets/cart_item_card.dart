import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/src/utils/constants.dart';
import 'package:sample_app/src/utils/utils.dart';
import 'package:sample_app/src/widgets/count_button.dart';
import 'package:sample_app/src/widgets/veg_indicator.dart';

class CartItemCard extends StatefulWidget {
  const CartItemCard({
    Key key,
    this.food,
    this.description,
    this.calories,
    this.addon,
    this.price,
    this.onItemCountChange,
    // this.onSelect
  }) : super(key: key);
  final String food;
  final String calories;
  final String description;
  final String price;
  final bool addon;
  // final Function onSelect;
  final ValueChanged<int> onItemCountChange;

  @override
  _CartItemCardState createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  int itemCount = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, dividedBy: 1),
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth(context, dividedBy: 40),
          vertical: screenHeight(context, dividedBy: 100)),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Text(
            widget.food ?? '',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Gradients.foodTextColor,
            ),
          ),
          SizedBox(
            height: screenHeight(context, dividedBy: 70),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ "+widget.price ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Gradients.foodTextColor,
                ),
              ),
              Text(
                (widget.calories) + " calories",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Gradients.foodTextColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: screenHeight(context, dividedBy: 70),
          ),
          Text(
            widget.description ?? '',
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 15, color: Colors.grey),
          ),
          SizedBox(
            height: screenHeight(context, dividedBy: 70),
          ),
          Container(
            width: screenWidth(context, dividedBy: 3),
            child: CountButton(
              onItemCountChange: widget.onItemCountChange,
            ),
          ),
          SizedBox(
            height: screenHeight(context, dividedBy: 70),
          ),
          widget.addon == true
              ? GestureDetector(
                  child: Text(
                    "Customizations Available",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        color: Colors.pink.withOpacity(0.6)),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
