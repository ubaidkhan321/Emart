

import 'package:e_seller_app/const/const.dart';

Widget ourbutton({color = purpleColor, String? title,onpress}){
  return InkWell(
    onTap: onpress,
    child: Container(
      height: 47,
      
      
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      
    
      ),
      child:  title!.text.white.fontWeight(FontWeight.bold).size(18).makeCentered() ,
    ),
  );
}