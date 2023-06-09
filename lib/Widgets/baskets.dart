import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../Static/ColorName.dart';
import '../Static/TextNames.dart';
import '../model/iteam_list.dart';

class myBasket extends StatelessWidget {
  const myBasket({super.key});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(child: ListView.builder(
        itemCount: Basketlist.length,
        itemBuilder:((context, index) {
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 10,
        child:Row(
          //mainAxisAlignment: MainAxisAlignment.end,
          children: [
          Container(child: Image.asset("images/${Basketlist[index].images}",height: 100,),),
          Expanded(
          flex: 2,  
          child:ListTile(
          title:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
            Text("${Basketlist[index].NameProdect}",style: TextStyle(fontSize: 20,color: Color(0xffa0a0a0),fontWeight: FontWeight.bold),),
          ],
          ),  
          subtitle: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Row(children: [
                Text(TextNames.quantityname),
                Text("${Basketlist[index].quantity}",style: TextStyle(fontSize: 18),),
              ],
              ),
              Row(children: [
              InkWell(
                child:Icon(Icons.delete,size: 30,color: Colors.red,),
                onTap:(){},
              ) ,
              ],
              ),
           
            ],
            ),
             Row(children: [
              Text(TextNames.pricename,style: TextStyle(fontSize: 18,color: Colors.black),),
              Text("${Basketlist[index].price}",style: TextStyle(fontSize: 18,color:Colors.black,fontWeight: FontWeight.bold),)
            ],
            )
          ],
          ),
          ),
          )
        ],
        )
      );
      }
      )
      )
      ),
    );
  }
}