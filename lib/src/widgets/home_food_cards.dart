import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/src/models/get_food_data_response.dart';
import 'package:sample_app/src/utils/constants.dart';
import 'package:sample_app/src/utils/utils.dart';
import 'package:sample_app/src/widgets/count_button.dart';
import 'package:sample_app/src/widgets/veg_indicator.dart';

class FoodsCard extends StatefulWidget {
  const FoodsCard({
    Key key,
    this.food,
    this.description,
    this.calories,
    this.image,
    this.addon,
    this.price,
    this.onItemCountChange,
    this.vegetarian,
    // this.onSelect
  }) : super(key: key);
  final String food;
  final String calories;
  final String image;
  final String description;
  final String price;
  final bool addon;
  final bool vegetarian;
  // final Function onSelect;
  final ValueChanged<int> onItemCountChange;

  @override
  _FoodsCardState createState() => _FoodsCardState();
}

class _FoodsCardState extends State<FoodsCard> {
  int itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return
        //   Container(
        //   width: screenWidth(context, dividedBy: 1),
        //   height:screenHeight(context, dividedBy:4),
        //     color:Colors.amber
        // );

        Container(
      width: screenWidth(context, dividedBy: 1),
      // height:screenHeight(context, dividedBy: 3),
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth(context, dividedBy: 40),
          vertical: screenHeight(context, dividedBy: 100)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              VegIndicator(
                vegetarian: widget.vegetarian,
              ),
              SizedBox(
                width: screenWidth(context, dividedBy: 70),
              ),
              Container(
                width: screenWidth(context, dividedBy: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.food ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Gradients.foodTextColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight(context, dividedBy: 70),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$ " + widget.price ?? '',
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
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.grey),
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
                        : Container()
                  ],
                ),
              ),
              Spacer(),
              Container(
                width: screenWidth(context, dividedBy: 4),
                height: screenWidth(context, dividedBy: 4),
                child: CachedNetworkImage(
                  imageUrl: widget.image,
                  fit: BoxFit.fill,
                  placeholder: (context, img) => Center(
                    child: SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation(Gradients.colors[3]))),
                  ),
                  errorWidget: (_, s, d) => Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 20,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
