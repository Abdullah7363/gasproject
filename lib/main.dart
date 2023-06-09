


import 'package:flutter/material.dart';
import 'package:gas_app/Controllers/counsumerController.dart';
import 'package:gas_app/Static/PageName.dart';
import 'package:gas_app/View/Register.dart';
import 'package:gas_app/View/ScreenSheard/loginConsumer.dart';
import 'package:gas_app/View/ScreenSupplier/Addprodcut.dart';
import 'package:gas_app/View/ScreenSupplier/HomePageSupplier.dart';
import 'package:gas_app/View/ScreenSupplier/Mangamment_product.dart';
import 'package:gas_app/View/TestView.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Static/Biniding.dart';
import 'Static/FontName.dart';
import 'View/ScreenConsumer/NvgationBar.dart';
import 'View/ScreenConsumer/homePageCoustomer.dart';

Future<void> main() async {
  
  await GetStorage.init();
  runApp(
    
    MyApp()
    );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  GetStorage storage = GetStorage();
  String cousId = "";
  String cousTypeUser = "";
  
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    if(storage.read(ControllerCounsumer.id) != null){
        
        cousId =  storage.read(ControllerCounsumer.id);
        cousTypeUser = storage.read(ControllerCounsumer.istypeUser);
  }else{
    print((storage.read(ControllerCounsumer.id)));
  }
  
  
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        fontFamily: FontName.vazirmatn,
        primarySwatch: Colors.orange,
      ),
      initialBinding: InitialBinding(),
      
      getPages:  [
          GetPage(name: PageName.login, page: () => Login()),
          GetPage(name: PageName.homePageCoustomer, page: () => HomePageCoustomer()),
          GetPage(name: PageName.homePageSupplier, page: () => HomePageSupplier()),
          GetPage(name: PageName.NvgationBar, page: () => NvgtionBar ()),
          GetPage(name: "/ManageProductsPage", page: () => ManageProductsPage()),
          
      ],
      locale: Get.deviceLocale,
      home: Scaffold(
        // ignore: unnecessary_null_comparison, unrelated_type_equality_checks
        body: 
        cousId.isNotEmpty  && cousTypeUser == "2" ? HomePageCoustomer():
        Login(),
      ),
    );
  }
}

