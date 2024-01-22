import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_appoinment_app_design/bottomNavigation.dart';
import 'package:medical_appoinment_app_design/controller/getx_controllers.dart';

class Cart extends StatelessWidget {
   Cart({super.key});
myControllers c=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart',style: TextStyle(color: Colors.green)),
        centerTitle: true,
        automaticallyImplyLeading: false,

      ),
body:ListView.builder(
  itemCount:c.favouriteList.length ,
  itemBuilder: (context, index)

  {
  return ListView(
    children: [
      ListTile(
        title: Text('shohan'),

      )

    ],

  );

},),
      bottomNavigationBar: BottomNavigation(),

    );
  }
}
