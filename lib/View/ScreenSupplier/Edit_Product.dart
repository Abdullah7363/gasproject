import 'package:flutter/material.dart';
import 'package:gas_app/Model/CURD.dart';
import 'package:gas_app/Model/ProductModel.dart';
import 'package:gas_app/Model/iteam.dart';
import 'package:gas_app/Static/Applink.dart';
import 'package:gas_app/Static/ColorNam.dart';
import 'package:gas_app/TestData/TestData.dart';
import 'package:gas_app/Widgets/Dailog.dart';
import 'package:gas_app/model/iteam.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../Controllers/Supplier_controller.dart';
import '../../Static/TextNames.dart';
import '../../Widgets/Counter.dart';
import '../../Widgets/TextFiled1.dart';
import 'Mangamment_product.dart';

class EditProductPage extends StatelessWidget {
  ProductController productController = Get.put(ProductController());
  final idController = TextEditingController();
  final productnnamecontroller = TextEditingController();
  final descriptionController = TextEditingController();
  final quantityController = TextEditingController();
  final priceController = TextEditingController();
  final imageController = TextEditingController();
  static int indexProduct = 0; 
  
  @override
  Widget build(BuildContext context) {
    ProductsModel model =  productController.listProducts[EditProductPage.indexProduct];
    productnnamecontroller.text = model.name.toString();
    descriptionController.text = model.description.toString();
    productController.filedControl.value = int.parse(model.quantity.toString());
    priceController.text = model.price.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text('تعديل  المنتج'),
        backgroundColor: ColorName.colorblue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InkWell(onTap: () {
              productController.getImage1(ImageSource.camera, context);
            }, child: GetBuilder<ProductController>(
              builder: (controller) {
                return CircleAvatar(
                    child: productController.imageFile == null && ManageProductsPage.b == true?
                         Image.network("$imageProductLink/${model.image.toString()}")
                           :productController.imageFile == null && ManageProductsPage.b == false? Icon(Icons.person): Image.file(productController.imageFile!));
              },
            )),
            Textfiled(
              filedControl: productnnamecontroller,
              obsText: false,
              inputType: TextInputType.text,
              labelText: TextNames.productName,
              valid: ((p0) {}),
            ),
            Textfiled(
              filedControl: descriptionController,
              obsText: false,
              inputType: TextInputType.streetAddress,
              labelText: TextNames.descriptionProduct,
              valid: ((p0) {}),
            ),
            Counter(
                isCounter: false,
              ),
            Textfiled(
              filedControl: priceController,
              obsText: false,
              inputType: TextInputType.number,
              labelText: TextNames.pricename,
              valid: (p0) {},
            ),
            MaterialButton(
              color: ColorName.colorblue,
              shape:RoundedRectangleBorder( borderRadius: BorderRadius.circular(25),),
              child: Text('تعديل'),
              onPressed: () async {
                
                final Curd mycurd = Get.find();
                if(productController.filedControl.value == 0){
                  return AlertDialog1(content: "يرجى اضافة الكمية");
                }
                if (productController.imageFile != null) {
                  var x =  await mycurd.postimagefile(
                      updateProductApi,
                      {
                        "productId":productController.listProducts[EditProductPage.indexProduct].id.toString(),
                        "productName": productnnamecontroller.text,
                        "description": descriptionController.text,
                        "price": priceController.text,
                        "quntity": productController.filedControl.value.toString(),      
                        "productImageName":productController.listProducts[EditProductPage.indexProduct].image.toString(),
                      },
                      productController.imageFile!,
                      "productImage");
                  
                  if (x) {
                    productnnamecontroller.clear();
                    priceController.clear();
                    descriptionController.clear();
                    ManageProductsPage.b = false;
                    productController.clearImage();
                    productController.filedControl.value = 0;
                    productController.getDataProducts("1");
                    AlertDialog1(title: "تم التعديل منتج بنجاح",content: "", iconData: Icons.check_sharp,);
                    
                    //كتب اي رسالة او تنقل الى صفحه ثانية
                    await Future.delayed(Duration(seconds: 2));
                    Navigator.pop(context);

                    Get.offNamed("/ManageProductsPage");
                  }
                 } else {
                  
                  
                  var x = await productController.EditProduct(productnnamecontroller.text,descriptionController.text,priceController.text);
                  if (x) {
                    productnnamecontroller.clear();
                    priceController.clear();
                    descriptionController.clear();
                    ManageProductsPage.b = false;
                    productController.clearImage();
                    productController.filedControl.value = 0;
                    productController.getDataProducts("1");
                    AlertDialog1(title: "تم التعديل منتج بنجاح",content: "", iconData: Icons.check_sharp,);
                    
                    //كتب اي رسالة او تنقل الى صفحه ثانية
                    await Future.delayed(Duration(seconds: 2));
                    Navigator.pop(context);

                    Get.offNamed("/ManageProductsPage");
                  }
                 
                  
                 
                 }
                
                
                //Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
