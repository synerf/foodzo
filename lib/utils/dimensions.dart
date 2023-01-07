import 'package:get/get.dart';

class Dimensions {
  // screen height and width
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  // pageview
  static double pageView = screenHeight / 2.64;
  static double pageViewController = screenHeight / 3.84;
  static double pageViewTextController = screenHeight / 7.03;

  // generic heights
  static double height10 = screenHeight / 84.4;
  static double height20 = screenHeight / 42.2;
  static double height15 = screenHeight / 56.27;
  static double height45 = screenHeight / 18.76;
  static double height30 = screenHeight / 28.13;

  // generic widths
  static double width5 = screenHeight / 168.8;
  static double width10 = screenHeight / 84.4;
  static double width20 = screenHeight / 42.2;
  static double width15 = screenHeight / 56.27;
  static double width30 = screenHeight / 28.13;

  // generic fonts
  static double font16 = screenHeight / 52.7;
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;

  // generic radius
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  // generic icon
  static double iconSize24 = screenHeight / 35.17;
  static double iconSize16 = screenHeight / 52.75;

  // food main page list view
  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextContentSize = screenWidth / 3.9;

  // popular food detail image
  static double popularFoodDetailImgSize = screenHeight / 2.45;

  // bottom height
  static double bottomBarHeight = screenHeight / 7.03;
}
