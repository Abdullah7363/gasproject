import 'package:flutter/material.dart';

import 'ComplaintPage.dart';

class  Complaint extends StatelessWidget {
 

   Complaint({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: ComplaintForm(),
    );
  }
}