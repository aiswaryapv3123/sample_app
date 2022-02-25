import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/src/bloc/bloc.dart';
import 'package:sample_app/src/bloc/events.dart';
import 'package:sample_app/src/bloc/states.dart';
import 'package:sample_app/src/models/get_food_data_response.dart';
import 'package:sample_app/src/screens/cart_page.dart';
import 'package:sample_app/src/utils/constants.dart';
import 'package:sample_app/src/utils/utils.dart';
import 'package:sample_app/src/widgets/custom_tab_view.dart';
import 'package:sample_app/src/widgets/home_food_cards.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = [];
  List<String> categoryId = [];
  List<int> cartList = [];
  List<String> cartFood = [];
  List<String> cartFoodDescription = [];
  List<String> cartFoodCalories = [];
  List<String> cartFoodPrice = [];
  List<CategoryDish> categoryDishes = [];
  int selectedCatId;
  Future<List<FoodDataResponse>> futureAlbum;
  List<TableMenuList> tableMenuList=[];
  List<String> foodList=[
    "Ice Creams",
    "Biriyani",
    "Chicken Tikka",
    "Avacado Smoothie"
  ];
  List<String> foodDescription=[
    "hgwdghgjdgdG",
    "JHWGDHJHJSJAH",
    "dhjshdksjkksdjk",
    "shgwsywtuyiisjjsmna"
  ];
  List<String> foodCalories=[
    "15",
    "20",
    "10",
    "9"
  ];
  List<String> foodPrice=[
    "23",
    "100",
    "50",
    "67"
  ];
  List<bool> foodAddOn=[
    true,
    true,
    false,
    true
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _loadData();
    futureAlbum = fetchAlbum();
  }

  _loadData() async {
    context.bloc<FoodBloc>().add(FoodEvents.fetchFoodList);
  }

  Future<List<FoodDataResponse>> fetchAlbum() async {
    String url = "https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad";
    // final response = await http.get(url);
    // var responseData = json.decode(response.body);
    final response =
        await http.get('https://jsonplaceholder.typicode.com/posts/1');

    // if (response.statusCode == 200) {
    //   // If the call to the server was successful, parse the JSON
    //   setState(() {
    //     categoryDishes.addAll(articleFromJson(response.body));
    //
    //   });
    //   print(FoodDataResponse.fromJson(json.decode(response.body)).restaurantName);
    //   return FoodDataResponse.fromJson(json.decode(response.body));
    //   // print("Status OK");
    // } else {
    //   // If that call was not successful, throw an error.
    //   throw Exception('Failed to load post');
    // }

    // return foodDataResponseFromJson(response.body);
    var jsonResponse = json.decode(response.body);
    return jsonResponse
        .table_menu_list
        .map((products) => new FoodDataResponse.fromJson(products))
        .toList();
    // print("Food List");
    // print(responseData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Icon(Icons.menu_rounded, color: Colors.black),
        actions: [
          Container(
            width: screenWidth(context, dividedBy: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap:(){
      push(context, CartPage(
        calories: cartFoodCalories,
        price:cartFoodPrice,
        description:cartFoodDescription,
        food:cartFood
      ));
    },
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight(context, dividedBy: 40),
                              horizontal: screenWidth(context, dividedBy: 30)),
                          child: Icon(
                            Icons.shopping_cart,
                            color: Colors.black,
                          )),
                    ),
                    Positioned(
                      right:screenWidth(context, dividedBy: 50),
                      top:screenHeight(context, dividedBy:100),
                      child: Container(
                          width: screenWidth(context, dividedBy: 25),
                          height: screenHeight(context, dividedBy: 25),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(cartList.length.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                          )),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
        bottom: PreferredSize(
            preferredSize: Size(screenWidth(context, dividedBy: 1),
                screenHeight(context, dividedBy: 12)),
            child: CustomTabView(
                categoryList: [
                  "Smoothies",
                  "Cakes",
                  "Biriyani",
                  "Salad and Soups"
                ],
                categoryId: [
                  "101",
                  "102",
                  "103",
                  "104"
                ],
                onTap: (val) {
                  selectedCatId = int.parse(val);
                  print("Val Id " + val.toString());
                })
            // child: BlocBuilder<FoodBloc, FoodStates>(
            //   builder: (BuildContext context, FoodStates state) {
            //     if (state is FoodErrorState) {
            //       final error = state.error;
            //       return Container(
            //         width: MediaQuery.of(context).size.width,
            //         // height: MediaQuery.of(context).size.height * 0.8,
            //         child: Center(
            //           child: Text(
            //             error,
            //             style: TextStyle(
            //                 fontSize: 16,
            //                 fontWeight: FontWeight.bold,
            //                 color: Gradients.colors[1],
            //                 fontFamily: "Exo-Regular"),
            //           ),
            //         ),
            //       );
            //     }
            //     if (state is FoodLoadedState) {
            //       for (int i = 0;
            //           i < state.foodDataList[0].tableMenuList.length;
            //           i++) {
            //         categories
            //             .add(state.foodDataList[0].tableMenuList[i].menuCategory);
            //         categoryId.add(
            //             state.foodDataList[0].tableMenuList[i].menuCategoryId);
            //       }
            //       return CustomTabView(
            //           categoryId: categories,
            //           categoryList: categoryId,
            //           onTap: (val) {
            //             selectedCatId = int.parse(val);
            //             print("Val Id " + val.toString());
            //           });
            //     }
            //     return Center(
            //       child: SizedBox(
            //           width: 16,
            //           height: 16,
            //           child: CircularProgressIndicator(
            //               strokeWidth: 2,
            //               valueColor:
            //                   AlwaysStoppedAnimation(Gradients.colors[3]))),
            //     );
            //   },
            // ),
            ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth(context, dividedBy: 90),
              vertical: screenHeight(context, dividedBy: 100)),
          child: Column(
            children: [
              // SizedBox(height: screenHeight(context, dividedBy: 30)),
              // FutureBuilder<List<FoodDataResponse>>(
              //   future: futureAlbum,
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       return Center(child: Text(snapshot.data[0].branchName== null ? "Not available": snapshot.data[0].branchName));
              //     } else if (snapshot.hasError) {
              //       print(snapshot.error);
              //       return Text("${snapshot.error}");
              //     }
              //     // To show a spinner while loading
              //     return CircularProgressIndicator();
              //   },
              // ),
              SizedBox(height: screenHeight(context, dividedBy: 30)),
              // BlocBuilder<FoodBloc, FoodStates>(
              //   builder: (BuildContext context, FoodStates state) {
              //     if (state is FoodErrorState) {
              //       final error = state.error;
              //       return Container(
              //         width: screenWidth(context, dividedBy: 1),
              //         height: screenHeight(context, dividedBy: 1),
              //         child: Center(
              //           child: Text(
              //             error,
              //             style: TextStyle(
              //                 fontSize: 16,
              //                 fontWeight: FontWeight.bold,
              //                 color: Gradients.colors[1],
              //                 fontFamily: "Exo-Regular"),
              //           ),
              //         ),
              //       );
              //     }
              //     if (state is FoodLoadedState) {
              //       // FoodDataResponse foodData = state.foodDataList;
              //       // for (int i = 0;
              //       //     i < foodData.tableMenuList.length;
              //       //     i++) {
              //       //   categoryDishes.add(
              //       //       foodData.tableMenuList[11].categoryDishes[i]);
              //       // }
              //       print(
              //           "Branch name " + state.foodDataList[0].branchName);
              //       return Text(
              //         state.foodDataList[0].branchName,
              //         style: TextStyle(
              //             fontSize: 16,
              //             fontWeight: FontWeight.bold,
              //             color: Gradients.colors[1],
              //             fontFamily: "Exo-Regular"),
              //       );
              //     }
              //     return Center(
              //       child: SizedBox(
              //           width: 16,
              //           height: 16,
              //           child: CircularProgressIndicator(
              //               strokeWidth: 2,
              //               valueColor: AlwaysStoppedAnimation(
              //                   Gradients.colors[3]))),
              //     );
              //   },
              // ),
              ListView.builder(
                itemCount: foodList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        behavior:HitTestBehavior.translucent,
                          onTap: () {
                            print("tapped");
                            setState((){
                              cartList.add(index);
                              cartFood.add(foodList[index]);
                              cartFoodDescription.add(foodDescription[index]);
                              cartFoodCalories.add(foodCalories[index]);
                              cartFoodPrice.add(foodPrice[index]);
                            });
                            print("Cart Length " + cartList.length.toString());
                          },
                        // child:Container(
                        //   width:1000,
                        //   height:50,
                        //   color:Colors.red
                        // )
                          child: FoodsCard(
                            image:
                                "https://www.thespruceeats.com/thmb/btLT5e97Xl3vBzNo37xPlUgfQcI=/3135x3900/filters:fill(auto,1)/GettyImages-90053856-588b7aff5f9b5874ee534b04.jpg",
                            vegetarian: true,
                            food: foodList[index],
                            description: foodDescription[index],
                            calories: foodCalories[index],
                            price: foodPrice[index],
                            onItemCountChange: (val) {},
                            addon: true,
                            // onSelect: () {
                            //   cartList.add(index);
                            //   print("Cart Length " +
                            //       cartList.length.toString());
                            // }
                          )
                      ),
                      Divider(
                        color: Gradients.colors[1],
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
