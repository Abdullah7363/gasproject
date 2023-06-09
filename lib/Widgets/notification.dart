import 'package:flutter/material.dart';
import '../Model/iteam_list.dart';
class notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("الاشعارات"),
          centerTitle: true,
          backgroundColor: Color(0xff528fbc),
        ),
        body: SafeArea(child:ListView.builder(
          itemCount: listnotification.length,
          itemBuilder:((context, index) {
            return Card(
              color: Color(0xfff2f3f5),
              shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),),
              elevation: 10,
             child:Column(
              //crossAxisAlignment: CrossAxisAlignment.end,
               children: [
               
                 Row(children: [
                  Row(
                    children: [
                      Container(child:Image.asset("images/${listnotification[index].images}",height: 100,fit: BoxFit.cover),
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 2,
                    child:ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Row(children: [
                          Text("${listnotification[index].title}")
                          
                        ],
                        ),
                        Row(
                          children: [
                           const Icon(Icons.timer),
                            Text("${listnotification[index].time}"),
                             InkWell(child: Icon(Icons.disc_full,size: 15,color: Colors.red,)),
                          ],
                        ),
                      ],
                      ),
                      subtitle:Row(
                        children: [
                          Text("${listnotification[index].description}"),
                        ],
                      ),
                    )
                    ),
                 ],
                 ),
               ],
             )
             );
          }
          )
          )
        ),
      ),
    );
  }
}