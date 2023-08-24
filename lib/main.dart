import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodzo/controllers/cart_controller.dart';
import 'package:foodzo/controllers/popular_product_controller.dart';
import 'package:foodzo/controllers/recommended_product_controller.dart';
import 'package:foodzo/pages/food/popular_food_detail.dart';
import 'package:foodzo/pages/food/recommended_food_detail_page.dart';
import 'package:foodzo/pages/home/food_page_body.dart';
import 'package:foodzo/pages/home/main_food_page.dart';
import 'package:foodzo/routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  // wait and make sure dependencies are loaded
  WidgetsFlutterBinding.ensureInitialized();
  // initialize dependencies
  await dep.init();
  // run app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    // status bar and navbar color change
    // transparent status bar and colored nav bar
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    //   systemNavigationBarColor: Colors.transparent,
    // ));
    //// hide
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    // // show with our mentioned colors
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark));
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MainFoodPage(),
      // initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
