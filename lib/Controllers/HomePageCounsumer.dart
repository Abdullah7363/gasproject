

import 'package:gas_app/Static/Applink.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Model/CURD.dart';
import '../Model/Coustomer.dart';
import '../Model/ProductModel.dart';
import '../Static/StatusRequest.dart';
import '../TestData/Funcation.dart';
import '../TestData/TestData.dart';
import 'counsumerController.dart';

class HomeCoustomerController extends GetxController{
  ControllerCounsumer counsumer = Get.put(ControllerCounsumer());
  StatusRequest statusRequest = StatusRequest.lodaing;
  StatusRequest statusRequest1 = StatusRequest.lodaing;
  int totalNotifications = -1;
  GetStorage storage = GetStorage();
  List<ProductsModel> listProducts = [];
  List<ProductsModel> Wi = [];
  TestData testData = TestData(Get.put(Curd()));
  getDataCoustomer() async{
      statusRequest = StatusRequest.lodaing;
      
      var response = await testData.getData(linkUrl: getCoustomerByIdphpApi, data: {
        "id":storage.read(ControllerCounsumer.id),
        
      });
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success){
        
       
        counsumer.coustmerModel = CoustmerModel.fromJson(response);
        
        
      update();
  } 
}
getDataProducts() async{
      
      statusRequest1 = StatusRequest.lodaing;
      
      var response = await testData.getData(linkUrl: getProductByIdUserphpApi, data: {
        "cousId":storage.read(ControllerCounsumer.id),
        
      });
      statusRequest1 = handlingData(response);
      
      if(statusRequest1 == StatusRequest.success){
       
        dynamic l  = response["data"];
        List l1 = l["products"];
        totalNotifications = response["data"]["TotalNotifications"];
        List l2 = l["Notifications"];
        listProducts.clear();
        l1.forEach((element) {
          
          listProducts.add(ProductsModel.fromJson(element));
        });
        
        
        //GetStorage storage =  GetStorage();
        // storage.write(ControllerCounsumer.id,coustmerModel!.id);
        // storage.write(ControllerCounsumer.istypeUser,coustmerModel!.istypeUser);
        
      
      }
      update();
  }
  
@override
  void onInit() {
    getDataProducts();
    if(counsumer.coustmerModel == null){
        getDataCoustomer();
    }else{
      statusRequest = StatusRequest.success;
    }
    super.onInit();
  }
  void incrment(int index){
    listProducts[index].quantityP++;
   }
   void descrment(int index){
    if(listProducts[index].quantityP.value != 0) {
      listProducts[index].quantityP--;
    }
   }

}