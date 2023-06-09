import 'package:dartz/dartz.dart';
import 'package:gas_app/Static/StatusRequest.dart';

handlingData(response){
  if(response is StatusRequest){
    return response;
  }else{
    return StatusRequest.success;
  }
}