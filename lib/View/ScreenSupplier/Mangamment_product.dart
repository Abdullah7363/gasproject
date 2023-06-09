import 'package:flutter/material.dart';
import 'package:gas_app/Static/Applink.dart';
import 'package:gas_app/Static/ColorNam.dart';
import 'package:gas_app/Static/StatusRequest.dart';
import 'package:gas_app/View/ScreenSupplier/Edit_Product.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Controllers/Supplier_controller.dart';
import '../../Static/TextNames.dart';
import '../../Widgets/Counter.dart';
import '../../model/iteam_list.dart';
import 'Addprodcut.dart';
class ManageProductsPage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  final quantityController = TextEditingController();
  static bool b = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ادارة منتجات'),
        backgroundColor: Color(0xff528fbc), 
        centerTitle: true,
      ),
      floatingActionButton:FloatingActionButton(
        backgroundColor: Color(0xff528fbc),
        
        onPressed: (){
           Get.to(AddProductPage());
        },child: Icon(Icons.add,size: 30,),
        
        ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<ProductController>(
              
              builder: ((controller){
                if(productController.statusRequest == StatusRequest.lodaing){
                    return Center(child: CircularProgressIndicator(),);
                }
                
                else if(productController.statusRequest == StatusRequest.faliure){
                  return Center(child: Icon(Icons.filter_list_outlined),);
                }else{
                return ListView.builder(
                itemCount:productController.listProducts.length,
                itemBuilder: (context, index) {
                  
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation:15,
                      color:Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),                    
                      child: Row(children: [
                    Container(child:  productController.listProducts[index].image != null? Image.network("$imageProductLink/${productController.listProducts[index].image}",width: 120,height: 120,fit: BoxFit.fill,) :Icon(Icons.production_quantity_limits),),
                     Expanded(
                        flex: 2,  
                        child:Row(
                          children: [
                             
                            Expanded(
                              flex: 2,
                              child: ListTile(
                                title:Text("${productController.listProducts[index].name}"),
                                
                                subtitle: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                          Text(TextNames.quantityname),
                                          Text("${productController.listProducts[index].quantity}"),
                                        ],
                                        ),
                                        
                                      ],
                                    ),
                                    SingleChildScrollView(
                                      ///scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                        Row(children: [
                                           Text(TextNames.pricename),
                                           Text("${productController.listProducts[index].price}")
                                        ],
                                        ),
                                        
                                      ],
                                      ),
                                    )
                                
                                  ],
                                ),
                            
                              ),
                            ),
                          ],
                        )
                        ),
                        Expanded(flex: 1,child: Row(
                          children: [
                            GestureDetector(onTap: () {
                              EditProductPage.indexProduct = index;
                              Get.to(EditProductPage());
                              ManageProductsPage.b = true;
                            },child: Icon(Icons.edit)),
                            GestureDetector(onTap: () {
                              EditProductPage.indexProduct = index;
                              productController.deleteProduct(productController.listProducts[index].id.toString(),);
                              
                            },child: Icon(Icons.delete,color: Colors.red,)),
                          ],
                        )),
                      ],
                      ),
                      
                    ),
                  );
                },
              );}}),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: ElevatedButton(
          //     child: Text('Add Product'),
          //     onPressed: () {
          //      Get.to(AddProductPage());
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}