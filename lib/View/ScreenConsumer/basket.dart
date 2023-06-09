import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../Static/ColorName.dart';
import '../../Static/TextNames.dart';
import '../../Widgets/baskets.dart';
class Basket extends StatelessWidget {
  const Basket({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorName.colorblue, 
        title: Text("سلة"),
        centerTitle: true,
      ),
      body: Form(
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 150,
            margin: EdgeInsets.only(left: 15,right: 15),
            color: Color(0xfff9ebd1),
            child:Padding(
              padding: const EdgeInsets.only(left:15,right:15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Row(children: [
                    MaterialButton(
                    color: ColorName.colorblue, 
                    onPressed:(){},child: Text(TextNames.locationName,style: TextStyle(fontSize: 17,color: Colors.white),),)
                    ],
                    ),
                    Row(children: [
                    Text(TextNames.DeliveryService),
                    Icon(Icons.location_on,color: ColorName.colorblue, size: 30,)
                    ],
                   ),
                 ],
               ),
            SizedBox(
             height: 100,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Row(children: [
            MaterialButton(
               color: ColorName.colorblue, 
               onPressed:(){},child: Text(TextNames.NameSpecificTime,style: TextStyle(fontSize: 17,color: Colors.white),),)
                      ],
                      ),
            Row(children: [
               Text(TextNames.ReservationService),
               Icon(Icons.timer,color:ColorName.colorblue, size: 30,)
                      ],
                     ),
                    ],
                   ),
                 ),
                ],
              ),
            )
          ),
            const Expanded(
            child: Padding(
            padding: const EdgeInsets.only(top:5),
            child: myBasket(),
            )
            ),
            SizedBox(
              height: 80,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Row(children: [
                    MaterialButton(
                       padding: EdgeInsets.symmetric(horizontal: 50),
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: ColorName.colorblue, 
                      onPressed: (){},child: Text("تاكيد",style: TextStyle(color: Colors.white)),)
                  ],),
                  MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal:50),
                    shape: RoundedRectangleBorder(side: BorderSide(color: ColorName.colorblue,width: 3),borderRadius: BorderRadius.circular(10)),
                     // color: Color(0xff528fbc),
                    onPressed: (){},child: Text("تعديل",style: TextStyle(color:ColorName.colorblue, ),),)
                ],
                ),
            ),
        ],
        ),
      ),
    );
  }
}

