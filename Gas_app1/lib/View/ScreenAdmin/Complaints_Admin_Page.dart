import 'package:flutter/material.dart';
import 'package:gas_app/View/ScreenAdmin/Complaint.dart';
import 'package:get/get.dart';

import '../../Controllers/ComplaintsController.dart';
import '../../Static/ColorNam.dart';


class ComplaintsAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إدارة الشكاوي'),
        backgroundColor: ColorName.colorblue,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 16.0),
            Text(
              'قائمة الشكاوي',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: GetX<ComplaintsController>(
                init: ComplaintsController(),
                builder: (controller) {
                  if (controller.isLoading.value) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (controller.complaints.isEmpty) {
                    return Center(
                      child: Text('لا يوجد شكاوي'),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: controller.complaints.length,
                      itemBuilder: (context, index) {
                        final complaint = controller.complaints[index];
                        return Card(
                          elevation: 5,
                          color: ColorName.colorblue,
                          child: ListTile(
                            title: Text(complaint.title,style: TextStyle(color: Colors.white),),
                            subtitle: Text(complaint.description,style: TextStyle(color: Colors.white)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.delete,color: Colors.white,),
                                  onPressed: () {
                                    controller.deleteComplaint(complaint);
                                  },
                                  
                                ),
                                 IconButton(onPressed: () {
                                  Get.to(Complaint());
                                 },
                                 icon: Icon(Icons.reply,size: 25,color: Colors.white,),
                            ),
                              ],
                            ),
                          
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}