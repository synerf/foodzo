import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodzo/controllers/cart_controller.dart';
import 'package:foodzo/controllers/popular_product_controller.dart';
import 'package:foodzo/pages/cart/cart_page.dart';
import 'package:foodzo/utils/app_constants.dart';
import 'package:foodzo/utils/dimensions.dart';
import 'package:foodzo/widgets/app_icon.dart';
import 'package:foodzo/widgets/expandable_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text.dart';
import '../../widgets/name_rating_info.dart';
import '../../widgets/small_text.dart';
import '../home/main_food_page.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;
  PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // main image at top
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodDetailImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!,
                  ),
                ),
              ),
            ),
          ),

          // icons on the main image
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => MainFoodPage());
                  },
                  child: AppIcon(icon: Icons.arrow_back_ios),
                ),
                GetBuilder<PopularProductController>(builder: (controller) {
                  return Stack(
                    children: [
                      AppIcon(icon: Icons.shopping_cart_outlined),
                      Get.find<PopularProductController>().totalItems >= 1
                          ? Positioned(
                              right: 0,
                              top: 0,
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => CartPage());
                                },
                                child: AppIcon(
                                  icon: Icons.circle,
                                  size: 20,
                                  iconColor: Colors.transparent,
                                  backgroundColor: AppColors.mainColor,
                                ),
                              ),
                            )
                          : Container(),
                      Get.find<PopularProductController>().totalItems >= 1
                          ? Positioned(
                              right: 5,
                              top: 3,
                              child: BigText(
                                text: Get.find<PopularProductController>().totalItems.toString(),
                                size: 12,
                                color: Colors.white,
                              ),
                            )
                          : Container(),
                    ],
                  );
                }),
              ],
            ),
          ),

          // food detail (content section)
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.popularFoodDetailImgSize - 20,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.radius20), topLeft: Radius.circular(Dimensions.radius20)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NameRatingInfo(text: product.name!),
                  SizedBox(height: Dimensions.height20),
                  BigText(text: "Introduce"),
                  SizedBox(height: Dimensions.height20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableText(
                        text: product.description!,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // bottom panel for add, remove quantity, add to cart button
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularProduct) {
          return Container(
            height: Dimensions.bottomBarHeight,
            padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30, left: Dimensions.width20, right: Dimensions.width20),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // add, remove quantity
                Container(
                  padding:
                      EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(false);
                        },
                        child: Icon(Icons.remove, color: AppColors.signColor),
                      ),
                      SizedBox(width: Dimensions.width5),
                      BigText(text: popularProduct.inCartItems.toString()),
                      SizedBox(width: Dimensions.width5),
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(true);
                        },
                        child: Icon(Icons.add, color: AppColors.signColor),
                      ),
                    ],
                  ),
                ),

                // add to cart button
                GestureDetector(
                  onTap: () {
                    popularProduct.addItem(product);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor,
                    ),
                    child: BigText(text: "\$ ${product.price!} | Add to cart", color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
