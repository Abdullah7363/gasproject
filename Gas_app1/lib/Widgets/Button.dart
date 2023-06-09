import 'package:flutter/material.dart';
import 'package:gas_app/RepatFunction/ScreenSizes.dart';
import 'package:gas_app/Static/ColorNam.dart';


class ButtonSign extends StatelessWidget {

  final String text;
  
  final void Function()? onTap;
  const ButtonSign({required this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(25),
        width: perWidth(context,whidth: 75),
        height: perHigh(context, 10),
        decoration: BoxDecoration(
          // ignore: prefer_const_constructors
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [ColorName.beginColorLogin,ColorName.endColorLogin]
          ),
          borderRadius: BorderRadius.circular(perHigh(context, 7))
        ),
        child: Center(child: Text(text,
              style: const  TextStyle(color: Colors.white,fontSize: 20,
              fontWeight: FontWeight.bold),)),
      ),
    );
  }
}