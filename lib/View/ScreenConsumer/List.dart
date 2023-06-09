import 'package:flutter/material.dart';

import '../../Static/ColorName.dart';
import '../../Widgets/TheList.dart';

class mylist extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f6f8),
      appBar: AppBar(title: Text('القائمة '),
      backgroundColor:ColorName.colorblue,
      centerTitle: true,
      ),
      body: Listmore(),
    );
  }
}
