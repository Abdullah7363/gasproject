import 'package:flutter/material.dart';
import 'package:gas_app/View/ScreenAdmin/datalismanagment.dart';
import 'package:get/get.dart';
import '../../Static/ColorNam.dart';
import '../../model/iteam_list.dart';


class Order_Managemet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ادارة الطلبات '),
        backgroundColor:ColorName.colorblue,
      ),
      body: ListView.builder(
        itemCount: Order.length,
        itemBuilder:(context,i){
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Container( 
            height: 250,
            width:double.infinity,
            padding: EdgeInsets.only(top: 25),
            margin: EdgeInsets.only(right: 10,left: 10),
              child: Card(
               shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),
               //side: BorderSide(color: Color(0xffF5F5F5),width: 10)
               ),
               
                elevation: 10,
                color:ColorName.colorblue,
                child: Padding(
                  padding: const EdgeInsets.only(right:20,top:20,bottom: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                          Row(
                            children: [
                              InkWell(
                                onTap:(() {
                                Get.to(dataisManagment());  
                                }
                                ),
                                child:Text( "  رقم الطلب : ${Order[i].Id}",style:  const TextStyle(fontSize: 20,color: Colors.white),)
                                ),
                            ],
                          ),
                      
                        Row(
                          children: [  
                            Text(" الاسم العميل : ${Order[i].NameConsumer}" ,style:  const TextStyle(fontSize: 20,color: Colors.white),),
                           Icon(Icons.person_search_sharp,size: 26, color: Colors.white),
                          ],
                        ),
                           
                        Row(
                          children: [
                            Text("اسم مورد : ${Order[i].NameSupplier}" ,style:  const TextStyle(fontSize: 20,color: Colors.white),),
                             Icon(Icons.person_search_sharp,size: 26,color: Colors.white),
                          ],
                        ),
                        
                        Row(
                          children: [
                            Text(" تاريخ الطلب : ${Order[i].Orderdate}",style:  const TextStyle(fontSize: 20,color: Colors.white)),
                             Icon(Icons.date_range_rounded,size: 26,color: Colors.white),
                          ],
                        )       
                 ]
              
              ),
            )
            )  
            ),
          );
        }
        ) ,

    );
  }
}