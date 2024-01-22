import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_appoinment_app_design/cart.dart';
import 'package:medical_appoinment_app_design/controller/getx_controllers.dart';
import 'package:medical_appoinment_app_design/homePage.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({super.key});

  myControllers c = Get.find();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: c.currentIndexs.toInt(),
        onTap: (int index) {
          c.changeIndex(index);
          if(c.currentIndexs==0)
            {
              Get.to(() => MyHomePage());
            }else if(c.currentIndexs==1){
            Get.to(() => Cart());
          }else if(c.currentIndexs==2){
            Get.to(() => MyHomePage());

          }

        },
        backgroundColor: Colors.green,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_rounded,
              color: Colors.white,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.white, // Color for the selected item's label
        unselectedItemColor: Colors.white
        // Handle tab selection changes
        );
  }
}
