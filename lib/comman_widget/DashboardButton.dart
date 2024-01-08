import 'package:e_seller_app/const/const.dart';

Widget dashboardbutton(context,{title,count,icon}){
  var size = MediaQuery.of(context).size;
  return  Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "$title".text.color(white).fontWeight(FontWeight.bold).make(),
                      "$count".text.color(white).fontWeight(FontWeight.bold).make(),
                    ],
                  ),
                ),
                Image.asset(icon,color: white,width: 40,)
              ],
            ).box.color(purpleColor).size(size.width *0.4, 80).rounded.padding( const EdgeInsets.all(8)).make();
        
}