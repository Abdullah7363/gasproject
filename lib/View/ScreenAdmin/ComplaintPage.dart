import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widgets/TextFiled1.dart';



class ComplaintForm extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _complaintController = TextEditingController();

  void _submitComplaint() {
    String name = _nameController.text.trim();
 
    String complaint = _complaintController.text.trim();

    if (name.isEmpty || complaint.isEmpty) {
      Get.snackbar("Error", "All fields are required.",backgroundColor: Colors.red);
    } else {
      Get.snackbar("Success", "Complaint submitted successfully,");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
         
           Textfiled(
            labelText: "عنوان شكوى",obsText: false,filedControl:_nameController,inputType: TextInputType.streetAddress,
            valid: (Value){

            },
           ),
            SizedBox(height: 10),
           
           
           Textfiled(
            labelText: "رد شكوى",obsText: false,filedControl:_complaintController, inputType: TextInputType.streetAddress,
            valid: (Value){
              
            },
           ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitComplaint,
              child: Text("ارسل"),
            ),
          ],
        ),
      ),
    );
  }
}