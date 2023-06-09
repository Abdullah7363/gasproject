import 'package:flutter/material.dart';
import 'package:gas_app/Controllers/HomePageCounsumer.dart';
import 'package:gas_app/Controllers/counsumerController.dart';
import 'package:gas_app/Static/Applink.dart';
import 'package:gas_app/Static/StatusRequest.dart';
import 'package:gas_app/Widgets/Counter.dart';
import 'package:photo_view/photo_view.dart';
import '../../Model/iteam_list.dart';
import '../../Static/ColorName.dart';
import '../../Static/TextNames.dart';
import '../../Widgets/notification.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart';
import 'Product.dart';

class HomePageCoustomer extends StatelessWidget {
 final quantityController = TextEditingController();
 ControllerCounsumer counsumer = Get.put(ControllerCounsumer());
 HomeCoustomerController homeCoustomer = Get.put(HomeCoustomerController());
  @override
  Widget build(BuildContext context) {
   
  //  if(homeCoustomer.statusRequest == StatusRequest.lodaing){
  //   return Center(child:CircularProgressIndicator());
  //  } else{
   
   return GetBuilder<HomeCoustomerController>(builder: (controller) {
   if(homeCoustomer.statusRequest == StatusRequest.lodaing || homeCoustomer.statusRequest1 == StatusRequest.lodaing){
    return Scaffold(
      appBar: AppBar(
        title: Text("الرئسية"),
        centerTitle: true,
        backgroundColor: ColorName.colorblue, 
      ),
      body: Center(child: CircularProgressIndicator(),));
   }  
   return Scaffold(
      
      appBar: AppBar(
        title: Text("الرئسية"),
        centerTitle: true,
        
        actions: [
         Badge(
     position: BadgePosition.topEnd(top: 0, end: 3),
     animationType: BadgeAnimationType.slide,
     badgeContent: Text('${homeCoustomer.totalNotifications}', style: TextStyle(color: Colors.white)),
     child: IconButton(icon: Icon(Icons.notifications), onPressed: () {
      Get.to(notifications());
     }
     ),
   )
       ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: Padding(
            padding: const EdgeInsets.only(right: 15,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(counsumer.coustmerModel!.name!,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
              ),
                ),
               Transform.scale(
                    scale:1,
                    child: InkWell(child: counsumer.coustmerModel!.isImageDoc != null? CircleAvatar(backgroundImage:NetworkImage("$imageDocLink/${counsumer.coustmerModel!.isImageDoc}"),):CircleAvatar(backgroundImage:AssetImage("Assets/imagess/m.png"),),
                    onTap: (
                        
                    ){
                      
                      
                    },
                    ),
                  ),
              ]
            ),
          ),
        ),
        backgroundColor: ColorName.colorblue, 
      ),
      body: SafeArea(child:RefreshIndicator(
        onRefresh: () {
          return homeCoustomer.getDataProducts();
        },

        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               InkWell(
                 child: Row(children: [
                     Icon(Icons.arrow_left,size:25,color: ColorName.colorblue,),
                     Text("عرض الكل ",style: TextStyle(color:ColorName.colorblue),)
                  ],
                  ),
                  onTap: (){
                  
                  },
               ),
              Padding(
                padding: const EdgeInsets.only(right:5),
                child: Row(
                  children: [
                  Text(TextNames.NameThemostimportantproducts,style: TextStyle(fontSize: 17),)
                  ],
                ),
              )
            ],
            ),
            Expanded(
              child: GridView.builder(
                itemCount: homeCoustomer.listProducts.length,
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                        mainAxisExtent: 270,
                      ) , itemBuilder:(context,index){
                return Card(
                  elevation: 15,
                  child: Column(children: [
                    Container(
                          padding: EdgeInsets.only(top: 15),
                          // في حال لم يجد صورة من السرفر سوف يرجع خطأ 404 تلقائيا
                          child: Image.network("$imageProductLink/${homeCoustomer.listProducts[index].image}",width:100,fit: BoxFit.fill,height: 100,)),
                    SizedBox(
                      child: Text("${homeCoustomer.listProducts[index].name}",style: TextStyle(fontSize:15),)),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${products[index].price}",style: TextStyle(fontSize: 15),),
                          Row(
                        children: [
                          Text(":الكمية",style: TextStyle(fontSize: 15),),
                          Text("100",style: TextStyle(fontSize: 15),),
                          
                        ],
                      ),
                        ],
                      ),
                      Counter(isCounter: true,counter: index),
                      Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: MaterialButton(
                        padding: EdgeInsets.symmetric(horizontal:30,),
                        color: ColorName.colorblue, 
                        onPressed: counsumer.coustmerModel!.isActiveAcount! != "0"? (){}:null,child:Text(TextNames.labelnameBasket,style: TextStyle(fontSize: 18,color: Colors.white),),),
                    )
                  ],
                  ),
                );
              }
              ),
            ),
          ],
        ),
      )
      ),
   
      );
      },
   );
  }}
//}
 
 