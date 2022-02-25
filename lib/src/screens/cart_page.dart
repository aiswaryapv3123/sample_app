import 'package:flutter/material.dart';
import 'package:sample_app/src/utils/constants.dart';
import 'package:sample_app/src/utils/utils.dart';
import 'package:sample_app/src/widgets/build_button.dart';
import 'package:sample_app/src/widgets/cart_item_card.dart';

class CartPage extends StatefulWidget {
  final List<String> food;
  final List<String> description;
  final List<String> calories;
  final List<String> price;
  const CartPage({
    Key key,
    this.food,
    this.description,
    this.price,
    this.calories,
  }) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text(
          "Order Summery",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Gradients.foodTextColor,
          ),
        ),
      ),
      body: Container(
        width:screenWidth(context,dividedBy:1),
        height:screenHeight(context, dividedBy:1),
        // padding: EdgeInsets.symmetric(
        //     horizontal: screenWidth(context, dividedBy: 30),
        //     ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth(context, dividedBy: 30),
                vertical:screenHeight(context, dividedBy:40)),
                child: Column(
                  children: [
                    Card(
                      elevation:2,
                      shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(6)),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth(context, dividedBy: 30),
                            vertical:screenHeight(context, dividedBy:40)),
                        child: Column(
                          children: [
                            Text(
                              "1 Dishes - 1 Items",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Gradients.foodTextColor,
                              ),
                            ),
                            ListView.separated(
                              itemCount: widget.food.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return CartItemCard(
                                  food: widget.food[index],
                                  description: widget.description[index],
                                  calories: widget.calories[index],
                                  price: widget.price[index],
                                  onItemCountChange: (val) {
                                  },
                                  addon: true,
                                );
                              },
                              separatorBuilder: (ctx, index) {
                                return Divider(
                                  color: Gradients.colors[1],
                                );
                              },
                            ),
                            SizedBox(height:screenHeight(context, dividedBy:30)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Amount",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Gradients.foodTextColor,
                                  ),
                                ),
                                Text(
                                  "\$230.00",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Gradients.foodTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight(context, dividedBy: 10)),
                  ],
                ),
              ),
            ),

            Positioned(
              bottom:screenHeight(context, dividedBy:30),
              right:screenWidth(context, dividedBy:30),
              left:screenWidth(context, dividedBy:30),
              child:BuildButton(
                label:"PLACE ORDER",
                onPressed:(){
                  showToast("Order Placed successfully");
                }
              )
            )
          ],
        ),
      ),
    );
  }
}
