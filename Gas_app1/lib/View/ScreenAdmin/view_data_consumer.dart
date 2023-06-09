
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../Widgets/Zomma.dart';
import '../../model/iteam_list.dart';
class viwe_data_consumer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(itemCount:consumer.length,itemBuilder: (context,i) {
            return Container(
           height: 450,
          width:double.infinity,
          padding: EdgeInsets.only(top: 25),
          margin: EdgeInsets.only(right: 10,left: 10),
              child: Card(
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              elevation: 20,
                child: Column(    
                  children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Icon(Icons.person,size: 100, color: Color(0xff0F4C81),),
                    ),
                    Text("${consumer[i].name}",style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                  ),
                  Row( 
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(children: [
                        Icon(Icons.date_range,color: Color(0xff0F4C81),), Text("التاريخ: ${consumer[i].date}",style: TextStyle(fontWeight: FontWeight.bold)),

                      ],),
                      Row(children: [
                        Icon(Icons.phone,color: Color(0xff0F4C81)),Text("الجوال: ${consumer[i].phone}",style: TextStyle(fontWeight: FontWeight.bold))
                      ],)
                  ],
                  ),
                  InkWell(child:Icon(Icons.arrow_drop_up,size:30,),
                  splashColor: Color(0xff0F4C81),
                    onTap: (){},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(children: [
                         Icon(Icons.location_on,color: Color(0xff0F4C81),),
                          Text(" الحي: ${consumer[i].Block}",style: TextStyle(fontWeight: FontWeight.bold),),

                      ],),
                      Row(children: [
                         Icon(Icons.location_on,color: Color(0xff0F4C81),),
                           Text(" المنطقة: ${consumer[i].Areas}",style: TextStyle(fontWeight: FontWeight.bold))
                      ],)
                  ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:10),
                    child: Zoomaimage(),
                  ),
                 Padding(
                   padding: const EdgeInsets.only(top:5),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(onPressed: (){}, child: Text("رفض"), 
                   
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      splashColor:Color(0xffA60036) ,
                      ),
                       MaterialButton(onPressed: (){}, child: Text("قبول"), 
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        splashColor:Color(0xff00a651) ,
                       ),
                      
                    ],
                   ),
                 )
                ],
                ),
         
          ),
            );
            
          },
          )
        
   
    );
  }
}