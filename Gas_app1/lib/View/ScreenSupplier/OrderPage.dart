/// صفحة عرض الطلبات الى المورد
import 'package:flutter/material.dart';
import 'package:gas_app/Static/ColorNam.dart';
import '../../Static/TextNames.dart';
import '../../model/iteam_list.dart';

class Order_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorName.colorblue
      ),
      body: SafeArea(child: Expanded(child:ListView.builder(
        itemCount: order.length,
        itemBuilder:(context,i){
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
             height: 270,
            width:double.infinity,
            padding: EdgeInsets.only(top: 25),
            margin: EdgeInsets.only(right: 10,left: 10),
            child: Card(
              color: Color.fromARGB(255, 242, 243, 244),

              elevation: 5,
              child: Padding(
               padding: const EdgeInsets.only(right:10,top:20,bottom: 30),
              child: Column(
                
               // mainAxisAlignment: MainAxisAlignment.end,
               crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                       Text( "${order[i].id}",style: TextStyle(fontSize: 20),),
                      Text(TextNames.ordernaber,style:TextStyle(color: Color(0xff737681),fontSize: 20)),
                    ],
                  ),
               
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text( order[i].nameConsumer,style: TextStyle(fontSize: 20)),
                    Text(TextNames.nameconsumer, style:TextStyle(color: Color(0xff737681),fontSize: 20) ,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    
                    Text( order[i].namesupplier,style: TextStyle(fontSize: 20)),
                    Text(TextNames.namesupplier,style:TextStyle(color: Color(0xff737681),fontSize: 20))
                  ],
                ),
                Container(
                  width: double.infinity,
                
                  color: ColorName.colorblue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text( order[i].date,style: TextStyle(fontSize: 20,color: Colors.white),),
                           Text(TextNames.dateorder,style:TextStyle(color: Colors.white,fontSize: 20)),
                        ],
                      ),
                        Row(
                          children: [
                            Text(order[i].nameservies,style: TextStyle(fontSize: 20,color: Colors.white)),
                            Text(TextNames.typeservise,style:TextStyle(color: Colors.white,fontSize: 19))
                          ],
                        )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                   MaterialButton(
                 
                  ///color: Colors.red,
                  onPressed: (){},child: Text("رفض",style: TextStyle(color: Colors.red
                  ),) ,
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                   side: BorderSide(
                    color: Colors.red,
                    width: 3,
                   )
                   
                   ),
                  
                  ),
                  MaterialButton(
                 // color: Colors.green,
                  onPressed: (){},child: Text("قبول ",style: TextStyle(color: Colors.green),), 
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                    color: Colors.green,
                      width: 2,
                  ),
                    )
                  ),
                  ],
                ),
              
               

              
              ],
              ),
            )
            ),
          ),
        );
      }
      )
      ),
      )

    );
  }
}