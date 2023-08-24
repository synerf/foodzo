import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodzo/controllers/popular_product_controller.dart';
import 'package:foodzo/controllers/recommended_product_controller.dart';
import 'package:foodzo/pages/cart/cart_page.dart';
import 'package:foodzo/routes/route_helper.dart';
import 'package:foodzo/utils/app_constants.dart';
import 'package:foodzo/utils/colors.dart';
import 'package:foodzo/widgets/big_text.dart';
import 'package:foodzo/widgets/expandable_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/cart_controller.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';

class RecommendedFoodDetail extends StatelessWidget {
  int pageId;
  RecommendedFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // sliver for appbar
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(icon: Icons.clear),
                ),
                // AppIcon(icon: Icons.shopping_cart_outlined),
                GetBuilder<PopularProductController>(builder: (controller) {
                  return Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => CartPage());
                        },
                        child: AppIcon(icon: Icons.shopping_cart_outlined),
                      ),
                      Get.find<PopularProductController>().totalItems >= 1
                          ? Positioned(
                              right: 0,
                              top: 0,
                              child: AppIcon(
                                icon: Icons.circle,
                                size: 20,
                                iconColor: Colors.transparent,
                                backgroundColor: AppColors.mainColor,
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
            toolbarHeight: 70,
            expandedHeight: 300,
            pinned: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(
                  child: BigText(
                    text: product.name!,
                    size: Dimensions.font26,
                  ),
                ),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius20), topRight: Radius.circular(Dimensions.radius20))),
              ),
            ),
            backgroundColor: AppColors.yellowColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // sliver for text
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                child: ExpandableText(
                  text: product.description!,
                ),
              )
            ],
          ))
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // for remove, add, display price
            Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width20 * 2.5, vertical: Dimensions.height10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.setQuantity(false);
                    },
                    child: AppIcon(
                      icon: Icons.remove,
                      backgroundColor: AppColors.mainColor,
                      iconColor: Colors.white,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  BigText(text: "\$ ${product.price!} X ${controller.inCartItems}", color: AppColors.mainBlackColor, size: Dimensions.font26),
                  GestureDetector(
                    onTap: () {
                      controller.setQuantity(true);
                    },
                    child: AppIcon(
                      icon: Icons.add,
                      backgroundColor: AppColors.mainColor,
                      iconColor: Colors.white,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                ],
              ),
            ),

            // for heart(fav), add to cart button
            Container(
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
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                        size: 24,
                      )),

                  // add to cart button
                  GestureDetector(
                    onTap: () {
                      controller.addItem(product);
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
            ),
          ],
        );
      }),
    );
  }
}
