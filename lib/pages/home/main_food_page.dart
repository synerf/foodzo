import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodzo/pages/home/food_page_body.dart';
import 'package:foodzo/utils/colors.dart';
import 'package:foodzo/utils/dimensions.dart';
import 'package:foodzo/widgets/big_text.dart';
import 'package:foodzo/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // header section
          Container(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                          text: "India", color: AppColors.mainColor, size: 30),
                      Row(
                        children: [
                          SmallText(text: "Mumbai", color: Colors.black54),
                          Icon(Icons.arrow_drop_down_rounded),
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: Dimensions.height45,
                    height: Dimensions.height45,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: Dimensions.iconSize24,
                    ),
                  )
                ],
              ),
            ),
          ),

          // body content
          const Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            ),
          ),
        ],
      ),
    );
  }
}
