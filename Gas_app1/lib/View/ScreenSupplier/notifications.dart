import 'package:flutter/material.dart';
import 'package:gas_app/Static/ColorNam.dart';
import '../../model/iteam_list.dart';
class notifications extends StatelessWidget {
  const notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorName.colorblue
      ),
      body: SafeArea(child:ListView.builder(
        itemCount: listnotification.length,
        itemBuilder:((context, index) {
          return Card(
            color: Color(0xffd6dbe1),
            shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
            elevation: 5,
           child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("${listnotification[index].title}",style: TextStyle(fontSize: 20,color: Color(0xff528fbc)),),
              Text("${listnotification[index].time}",style: TextStyle(fontSize: 20,color: Color(0xff528fbc)),
              )
            ],            
            ),
            subtitle: Text("${listnotification[index].description}",style: TextStyle(fontSize: 20,color: Color(0xff528fbc)),

            ),
            leading:Image.asset("assets/images/${listnotification[index].images}",width:100,)
            ),
           );
        
        }
        )
        )
      
       ),
    );
  }
}