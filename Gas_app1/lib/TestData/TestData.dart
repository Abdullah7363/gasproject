import 'package:dartz/dartz.dart';
import 'package:gas_app/Model/CURD.dart';
import 'package:gas_app/Static/StatusRequest.dart';

class TestData{
  final Curd curd;
  TestData(this.curd);
  
  getData({required String linkUrl,required Map data})async{
    Either response =  await curd.postData(linkUrl, data);
    return response.fold((l) => l, (r) => r);
  }
}