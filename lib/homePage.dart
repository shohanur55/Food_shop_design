import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_appoinment_app_design/bottomNavigation.dart';
import 'package:medical_appoinment_app_design/controller/getx_controllers.dart';
import 'package:medical_appoinment_app_design/orderPage.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

myControllers c=Get.put(myControllers());



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(19.0),
          child: ListView(
            children: [

              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar (
                      radius: 30, // Adjust radius as needed
                      backgroundImage: AssetImage('lib/assets/images/img.jpg'),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi,Shohan',
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'What would you like to order?',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(13),
                  ),
                  child: Image(
                    image: AssetImage('lib/assets/images/first.jpeg'),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  // height: 189,
                   // height: MediaQuery.of(context).size.height/4,
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black12, // Adjust color as needed
                      width: 1, // Adjust width as needed
                    ),
                  ),
                  child:
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search here your favourite food',
                            hintStyle: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  )


                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 2), // Add spacing before the ListView

                Container(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection:
                          Axis.horizontal, // Set scroll direction to horizontal
                      itemCount: c.foods.length,
                      itemBuilder: (context, index) {
                        Map<dynamic, dynamic> food = c.foods[index];
                        return Container(
                          width: 90, // Adjust width as needed
                          child: Column(
                            children: [
                              // Display image
                              ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(13),
                                ),
                                child: Image.asset(
                                  food['f_pic'],
                                  height: 60,
                                  fit: BoxFit.cover, // Adjust height as needed
                                ),
                              ),
                              SizedBox(height: 5),
                              // Display name and price
                              Text(
                                food['f_name'],
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        );
                      },
                    )),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Most Popular Foods',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      //width: 130,
                    ),
                    Row(
                      children: [
                        Text(
                          'View all',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          color: Colors.green,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),


                  ],
                ),
                SizedBox(
                  height: 9,
                ),
                Container(
                    height: 160,
                    child: ListView.builder(
                      scrollDirection:
                          Axis.horizontal, // Set scroll direction to horizontal
                      itemCount: c.foods.length,
                      itemBuilder: (context, index) {
                        Map<dynamic, dynamic> food = c.foods[index];
                        return InkWell(
                          onTap: (){
                            Get.to(() => OrderPage(
                              f_name:food!['f_name'],
                            f_pic: food!['f_pic'],
                              f_price: food!['f_price'],
                              f_index:food.toString(),

                            ));
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.green, // Adjust color as needed
                                width: 1, // Adjust width as needed
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Display image
                                ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(13),
                                  ),
                                  child: Image.asset(
                                    food['f_pic'],
                                    height: 90,

                                    fit: BoxFit.cover, // Adjust height as needed
                                  ),
                                ),
                                SizedBox(height: 5),
                                // Display name and price
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      food['f_name'],
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (c.favouriteList.contains(c.foods[index].toString())) {
                                          c.removeitem(c.foods[index].toString());
                                        } else {
                                          c.additem(c.foods[index].toString());
                                        }
                                      },
                                      child: Obx(
                                            () => c.favouriteList.contains(c.foods[index].toString())
                                                ?Icon(
                                              Icons.favorite,color:Colors.red)
                              :Icon(Icons.favorite_outline,color:Colors.red),

                                        ),
                                      ),



                                  ],
                                ),
                                Text(
                                  food['f_price'].toString()+'\$',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )),
              ],
            ), ],
          ),
        ),
        bottomNavigationBar:BottomNavigation(),
      ),
    );
  }
}
