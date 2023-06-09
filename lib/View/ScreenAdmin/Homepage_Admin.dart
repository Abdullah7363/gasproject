import 'package:flutter/material.dart';
import 'package:gas_app/Static/ColorNam.dart';
import 'package:get/get.dart';


import '../../model/iteam_list.dart';


class Homepage_Admin extends StatelessWidget {
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        title:Text("صفحة الرئيسية "),
        backgroundColor: Color(0xff528fbc),
      ),
    
      body: GridView.builder(
            padding: EdgeInsets.all(16.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
            ),
            itemCount: mycard1.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  // افتح صفحة مختلفة عند النقر على بطاقة الصفحة
                  Get.toNamed('/page${index+1}');
                },
                child: Card(
                  color:ColorName.colorblue,
                  elevation: 10,
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child:Padding(
                    padding: const EdgeInsets.only(top:50),
                    child: Column(children: [
                      Icon(mycard1[index].icon,size: 40,color: Colors.white),
                      SizedBox(
                        height: 20,
                      ),
                      Text("${mycard1[index].title}",style: TextStyle(color: Colors.white),)
                      
                    ],),
                  )
              
                ),
              );
            },
          )
    );
  }
}