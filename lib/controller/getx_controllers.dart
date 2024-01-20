
import 'package:get/get.dart';

class myControllers extends GetxController{

  RxList<Map<String, dynamic>> foods = [
    {
      'f_pic': 'lib/assets/images/burger.jpg',
      'f_name': 'Burger',
      'f_price': '\50\$'
    },
    {
      'f_pic': 'lib/assets/images/cakes.jpg',
      'f_name': 'Cake',
      'f_price': '\10\$'
    },
    {
      'f_pic': 'lib/assets/images/burger.jpg',
      'f_name': 'Burgers',
      'f_price': '\50\$'
    },
    {
      'f_pic': 'lib/assets/images/cakes.jpg',
      'f_name': 'Cakes',
      'f_price': '\10\$'
    },
    {
      'f_pic': 'lib/assets/images/cakes.jpg',
      'f_name': 'cakes',
      'f_price': '\10\$'
    },
    {
      'f_pic': 'lib/assets/images/burger.jpg',
      'f_name': 'Burger',
      'f_price': '\50\$'
    },
    {
      'f_pic': 'lib/assets/images/cakes.jpg',
      'f_name': 'Cakes',
      'f_price': '\10\$'
    },
  ].obs;

  RxList favouriteList=[].obs;

  removeitem( valuee_item){
    favouriteList.remove(valuee_item);
  }

  additem(valuee_item){
    favouriteList.add(valuee_item);
  }

}