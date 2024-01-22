import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_appoinment_app_design/bottomNavigation.dart';

import 'controller/getx_controllers.dart';

class OrderPage extends StatelessWidget {
  final String f_name;
  final String f_pic;
  final int f_price;
  final String f_index;
  OrderPage(
      {super.key,
      required this.f_index,
      required this.f_name,
      required this.f_pic,
      required this.f_price});

  myControllers c = Get.find();

  @override
  Widget build(BuildContext context) {
    double m_total = (c.count * f_price).toDouble();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              child: Image.asset(
                f_pic,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  f_name,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
                Container(
                  height: 60,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.green,
                  ),
                  child: Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            if (c.count > 1) {
                              c.decrement();
                            }
                          },
                          child: Text(
                            '-',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          )),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Obx(() => Center(
                                child: Text(
                              c.count.toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ))),
                      ),
                      TextButton(
                          onPressed: () {
                            c.increment();
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ))
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Item Total:',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
                Obx(
                  () => Text(
                    '\$' + c.total(f_price, c.count.toInt()).toString(),
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: Colors.red),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 70,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    fixedSize: MaterialStateProperty.all(Size(00, 70))),
                onPressed: () {
                  c.additem(f_index);

                  Get.back();
                },
                child: Text(
                  'Add to cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                  ),
                )),
          ],
        ),
      ),
          bottomNavigationBar: BottomNavigation(),
    ));
  }
}
