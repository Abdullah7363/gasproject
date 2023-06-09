import 'package:flutter/material.dart';
import 'package:gas_app/Controllers/ControllerLogin.dart';
import 'package:gas_app/Controllers/counsumerController.dart';
import 'package:gas_app/Model/CURD.dart';
import 'package:gas_app/RepatFunction/ScreenSizes.dart';
import 'package:gas_app/Static/Applink.dart';
import 'package:gas_app/Static/PageName.dart';
import 'package:gas_app/Static/StatusRequest.dart';
import 'package:gas_app/Static/TextNames.dart';
import 'package:gas_app/Widgets/Dailog.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../RepatFunction/ValidFun.dart';
import '../../Widgets/Button.dart';
import '../../Widgets/textFiled.dart';

class Login extends StatelessWidget {
  final GetStorage storage = GetStorage();
  final GlobalKey<FormState> globalKey = GlobalKey();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final ControllerCounsumer controllerCounsumer = Get.put(ControllerCounsumer());
  final ControllerLogin controllerLogin = Get.put(ControllerLogin());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
         top: true,
         bottom: true,
         right: true,
         left: true,
         child: GetBuilder<ControllerCounsumer>(builder: ((controller) {
             
        if(controller.statusRequest == StatusRequest.lodaing){   
        return Stack(
          children: [
          Center(child: CircularProgressIndicator(),),  
          Container(
            margin: EdgeInsets.symmetric(horizontal: perWidth(context, whidth: 7)),
            child: (Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ignore: prefer_const_literals_to_create_immutables      
                  Form(
                        key: globalKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextFiledGas(labelText: TextNames.labelPhoneAr,iconTextFiled: Icons.phone,obsText: false,inputType: TextInputType.number,
                                valid: (val) {
                                return phoneOrNameFiled(val!,isPhone:true,min: 3,max: 20);
                                },
                                filedControl: phone,
                                ),
                                TextFiledGas(labelText: TextNames.labelPasswordAr,iconTextFiled: Icons.lock,obsText: true,
                                  valid: (val) {
                                  return phoneOrNameFiled(val!,min: 3,max: 20);
                                  },
                                  filedControl: password,
                                  ),
                                  ButtonSign(text: TextNames.labelButtonLoginAr,onTap: ()async {
                                  
                                  if(globalKey.currentState!.validate()){
                                    await controllerCounsumer.getDataLogin(phone.text,password.text);
                                     
                                     if(controllerCounsumer.statusRequest == StatusRequest.success){
                                        storage.write("cousId", controllerCounsumer.coustmerModel!.id.toString());
                                        storage.write("cousIsTypeUser", controllerCounsumer.coustmerModel!.istypeUser.toString());
                                        storage.write("cousBlockId", controllerCounsumer.coustmerModel!.block!.id.toString());
                                        print(controllerCounsumer.coustmerModel!.block!.id.toString());
                                        Get.offNamed(PageName.NvgationBar);
                                     }else if(controllerCounsumer.statusRequest == StatusRequest.faliure){
                                      AlertDialog1(title: "خطأ",content: "رقم الجوال او كلمة المرور غير صحيحة ",iconData: Icons.error);
                                     }
        
                                    // if true go to HomePage Supplier
                                    // if false go to HomePage Coustmer
                                  }
                                        
                                  },),
                                  GetX<ControllerLogin>(
                                    
                                    builder: (controller) {
                                    return CheckboxListTile(
                                      title: const Text(TextNames.labelRadioLoginAr,style: TextStyle(fontSize: 20),),
                                      value: controllerLogin.isSelectRadio.value, onChanged: ((value) {
                                          controllerLogin.isSelectRadio.value = value!;
                                    }));
                                      // ignore: unrelated_type_equality_checks
                                      
                                  },),
                                 ],
                               ),
                                     
                             ),       
              ],
              )
            ),
          
          ),

          ],
        );
        }else{
          return Container(
            margin: EdgeInsets.symmetric(horizontal: perWidth(context, whidth: 7)),
            child: (Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ignore: prefer_const_literals_to_create_immutables      
                  Form(
                        key: globalKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextFiledGas(labelText: TextNames.labelPhoneAr,iconTextFiled: Icons.phone,obsText: false,inputType: TextInputType.number,
                                valid: (val) {
                                return phoneOrNameFiled(val!,isPhone:true,min: 3,max: 20);
                                },
                                filedControl: phone,
                                ),
                                TextFiledGas(labelText: TextNames.labelPasswordAr,iconTextFiled: Icons.lock,obsText: true,
                                  valid: (val) {
                                  return phoneOrNameFiled(val!,min: 3,max: 20);
                                  },
                                  filedControl: password,
                                  ),
                                  ButtonSign(text: TextNames.labelButtonLoginAr,onTap: ()async {
                                  
                                  if(globalKey.currentState!.validate()){
                                    await controllerCounsumer.getDataLogin(phone.text,password.text);
                                     
                                     if(controllerCounsumer.statusRequest == StatusRequest.success){
                                        
                                        Get.offNamed(PageName.homePageCoustomer);
                                     }else if(controllerCounsumer.statusRequest == StatusRequest.faliure){
                                      AlertDialog1(title: "خطأ",content: "رقم الجوال او كلمة المرور غير صحيحة ",iconData: Icons.error);
                                     }
        
                                    // if true go to HomePage Supplier
                                    // if false go to HomePage Coustmer
                                  }
                                        
                                  },),
                                  GetX<ControllerLogin>(
                                    
                                    builder: (controller) {
                                    return CheckboxListTile(
                                      title: const Text(TextNames.labelRadioLoginAr,style: TextStyle(fontSize: 20),),
                                      value: controllerLogin.isSelectRadio.value, onChanged: ((value) {
                                          controllerLogin.isSelectRadio.value = value!;
                                    }
                                    )
                                    );
                                      // ignore: unrelated_type_equality_checks
                                      
                                  
                                  
                                  },),
                                 ],
                               ),
                                     
                             ), 
                     
              ],
              )
            ),
          
          );
        }
        }
        )
        ),
      )   
    );
  }
}