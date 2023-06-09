import 'package:flutter/material.dart';

import '../RepatFunction/ScreenSizes.dart';
import '../Static/ColorName.dart';



class Textfiled extends StatelessWidget {

final String labelText;
final bool? obsText;
final TextEditingController filedControl;
final TextInputType? inputType;
final String? Function(String?) valid;
  
  const Textfiled({required this.filedControl,required this.inputType,required this.obsText,required this.labelText,required this.valid ,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            width: 350,
            height: 70,
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              
              controller: filedControl,
              keyboardType: inputType,
              validator: valid,
              decoration: InputDecoration(
                
                labelText: labelText,
                labelStyle: TextStyle(color: ColorName.textTextFiled),
                ///prefixIcon: Icon(iconTextFiled,color: ColorName.iconTextFiled,),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(perHigh(context,5)),borderSide: const BorderSide(style: BorderStyle.none)
                ),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(perHigh(context,5)),borderSide: const BorderSide(style: BorderStyle.none ),
                ),
                
                filled: true,
                fillColor: Colors.white, 
                ),
                obscureText: obsText!,
                
                ),
          
      );
  }
}