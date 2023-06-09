import 'package:flutter/material.dart';
import '../Static/ColorNam.dart';
class Listmore extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(30),
        child: ListView(
          children: [
            ListTile(
              onTap: () {},
              trailing: Icon(Icons.person,color: ColorName.colorblue, ),
              title: Text(
                "حسابي",style:TextStyle(color: ColorName.colorblue, ),
              ),
            ),
            Divider(
              color: ColorName.colorblue, 
            ),
            ListTile(
              onTap: () {},
              trailing: Icon(Icons.shop,color: ColorName.colorblue, ),
              title: Text("الطلبات السابقة",style:TextStyle(color:ColorName.colorblue, ),),
            ),
            Divider(
              color:  ColorName.colorblue, 
            ),
            ListTile(
              onTap: () {},
              trailing: Icon(Icons.phone,color:ColorName.colorblue, ),
              title: Text(" تواصل معنا ",style:TextStyle(color: ColorName.colorblue, ),),
            ),
            Divider(
              color: ColorName.colorblue, 
            ),
            ListTile(
              onTap: () {},
              trailing: Icon(Icons.notifications_active,color: ColorName.colorblue, ),
              title: Text("  الاشعارات ",style:TextStyle(color:ColorName.colorblue, ),),
            ),
            Divider(
              color: ColorName.colorblue, 
            ),
            ListTile(
              onTap: () {},
              trailing: Icon(Icons.settings,color: ColorName.colorblue, ),
              title: Text("  الاعدادات ",style:TextStyle(color: ColorName.colorblue, ),),
            ),
            Divider(
              color: ColorName.colorblue, 
            ),
            ListTile(
              onTap: () {},
              trailing: Icon(Icons.comments_disabled_rounded,color: ColorName.colorblue, ),
              title: Text("شكاوي",style:TextStyle(color: ColorName.colorblue, ),),
            ),
            Divider(
              color: ColorName.colorblue, 
            ),
            ListTile(
              onTap: () {},
              trailing: Icon(Icons.share,color:ColorName.colorblue, ),
              title: Text(" شارك التطبيق",style:TextStyle(color:ColorName.colorblue, ),),
            ),
            Divider(
              color:  ColorName.colorblue, 
            ),
            ListTile(
              onTap: () {},
              trailing: Icon(Icons.logout_outlined,color: ColorName.colorblue, ),
              title: Text("تسجيل خروج ",style:TextStyle(color:ColorName.colorblue, ),),
            ),
          ],
        ),
      );
    }
}