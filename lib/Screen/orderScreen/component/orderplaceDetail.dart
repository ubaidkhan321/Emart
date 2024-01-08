

import 'package:e_seller_app/const/const.dart';

Widget orderplace({t1,t2,d1,d2}){

  return  Padding(
             padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //"$t1".text.fontFamily(semibold).make(),
                    //"$d1".text.color(redColor).fontFamily(bold).make()
                    "$t1".text.color(purpleColor).make(),
                    "$d1".text.color(red).make()
           
                ],),
                SizedBox(
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     "$t1".text.color(purpleColor).make(),
                    "$d1".text.color(fontGrey).make()
                           
                           
                  ],),
                )
              ],
             ),
           );
}