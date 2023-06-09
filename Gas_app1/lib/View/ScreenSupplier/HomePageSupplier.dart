import 'package:flutter/material.dart';
import 'package:gas_app/Model/iteam_list.dart';
import 'package:get/get.dart';

import '../../Model/iteam.dart';
import '../../Widgets/Drawer.dart';
import '../../model/iteam_list.dart';


class HomePageSupplier extends StatelessWidget {
  
  List<MyHome>myhome=[
  MyHome(Icons.shopping_cart, "صفحة الطلبات ","ManageProductsPage"),
  MyHome(Icons.add_shopping_cart, "اضافة منتج","ManageProductsPage")
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        title:Text("صفحة الرئيسية "),
        backgroundColor: Color(0xff528fbc),
      ),
      drawer:Dra(
        titleTexthome:"صفحة الرئيسية ",
        Trailinghome: Icons.home,
        titleTextaccount:"حسابي",
        Trailingaccount: Icons.person,
        titleTextSettings: "الاعدادت",
        TrailingSettings: Icons.settings,
        titleTextnotifications: "الاشعارات",
        Trailingnotifications: Icons.notifications,
        titleTextLogout: "تسجيل خروج",
        TrailingLogout: Icons.logout,
      ),
    
      body: GridView.builder(
            padding: EdgeInsets.all(16.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
            ),
            itemCount: myhome.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                
                  // افتح صفحة مختلفة عند النقر على بطاقة الصفحة
                Get.toNamed(myhome[index-1].pageName);
                },
                child: Card(
                  color: Color(0xff528fbc),
                  elevation: 10,
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child:Padding(
                    padding: const EdgeInsets.only(top:50),
                    child: Column(children: [
                      Icon(myhome[index].icon,size: 40,color: Colors.white),
                      SizedBox(
                        height: 20,
                      ),
                      Text("${myhome[index].title}",style: TextStyle(color: Colors.white),)
                      
                    ],
                    ),
                  )
              
                ),
              );
            },
          )
    );
  }
}