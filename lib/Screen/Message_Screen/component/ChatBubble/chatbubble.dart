 
 import 'package:e_seller_app/const/const.dart';

Widget sellerchatbubble(){
  return  Directionality(
   // textDirection: data['uid'] == currentuser!.uid ? TextDirection.rtl : TextDirection.rtl,
   textDirection: TextDirection.rtl,
    child: Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 8),
                  decoration: const  BoxDecoration(
                    
                    //color: data['uid'] == currentuser!.uid ?   Colors.blue : Colors.green,
                    color: purpleColor,
                    borderRadius:  BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
  
                    )
  
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                    //"${data['msg']}".text.white.size(16).make(),
                    "hello world".text.white.size(16).make(),
                     //time.text.color(whiteColor.withOpacity(0.5)).make()
                     "10:45PM".text.color(white.withOpacity(0.5)).make()
                    ],
                  ),
                ),
  );
}