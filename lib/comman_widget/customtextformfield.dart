import 'package:e_seller_app/const/const.dart';

Widget customtextfield({labelname,hintname, icon,isdense = false,controller}){
  return Column(
    children: [
      TextFormField(
        style: const TextStyle(
          color: white,
        ),
        controller: controller ,
        maxLines: isdense ? 4 : 1,
        decoration: InputDecoration(
          hintText: "$hintname",
          
          label: "$labelname".text.white.make(),
          suffixIcon:  icon,
          
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: white,
            )
          ),
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: white,
            )
          )
        ),
        
      ),
      10.heightBox
    ],
  );
  
}