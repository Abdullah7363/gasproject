import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Model/iteam_list.dart';
import '../../Static/ColorName.dart';
class MyOrder extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xfff6f6f8),
        appBar: AppBar(
          title: Text("طلباتي"),
          centerTitle: true,
          backgroundColor: ColorName.colorblue,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 3, right: 4, top: 3),
                    child: Container(
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text("طلبات القيد الانتظار"),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 50),
                              primary: ColorName.colorblue,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "طلبات منتهية",style:TextStyle(color: Color(0xff528fbc)),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 50),
                              primary: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                          MyOorderlistr.length,
                          (i) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(color : Color.fromARGB( 255, 242, 243, 245),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              elevation: 10,
                              child: Row(
                                children: [
                                  Container(child: Image.asset("images/${MyOorderlistr[i].images}",height: 100,),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: ListTile(
                                      title: Column(
                                        crossAxisAlignment:  CrossAxisAlignment.start,
                                        children: [
                                          Text("${MyOorderlistr[i].dateorder}",style: TextStyle( color: Color(0xffc8cbcd),fontSize: 18, fontWeight: FontWeight.bold,),
                                          ),
                                          Text("${MyOorderlistr[i].productsName}", style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,),
                                          ),
                                        ],
                                      ),
                                      subtitle: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text( "${MyOorderlistr[i].servertypes}", style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold,)
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                children: [
                                                  Text("${MyOorderlistr[i].quantity}",style: TextStyle( color: Color.fromARGB(255, 150, 151, 153),fontSize: 18,fontWeight:FontWeight.bold,), 
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${MyOorderlistr[i].totalPrice}",
                                                    style: TextStyle( color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}