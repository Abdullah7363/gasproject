  import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/Tapcontrooler.dart';
import '../../Static/ColorNam.dart';
import 'data_consumer.dart';
import 'view_data_consumer.dart';
class view_data_consumer  extends StatelessWidget { 
  final MyController controller = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ادارة العملاء'),
          backgroundColor: ColorName.colorblue,
          bottom:  
             
          TabBar(
            indicatorColor: Colors.white,
             controller: controller.tabController,
          
                    
            tabs: [
              
              Tab(
                
                text: 'عرض بيانات العملاء ',
              ),
              Tab(
                text: 'عرض العملاء قيد الانتطار',
              ),
              
            ],
          ),
        ),
        body: TabBarView(
                controller: controller.tabController,
            children: [
              data_consumer(),
              viwe_data_consumer(),
            ],
          ),
       
      ),
    );
  }
}