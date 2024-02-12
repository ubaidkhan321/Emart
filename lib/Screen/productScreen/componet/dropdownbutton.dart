import 'package:e_seller_app/Screen/controller/product_controller.dart';
import 'package:e_seller_app/const/const.dart';
import 'package:get/get.dart';

Widget dropdownbutton(hint,List<String>list,dropdown,Productcontroller controller) {
  return Obx(()=>
    DropdownButtonHideUnderline(
            child: DropdownButton<String>(
                hint: "$hint".text.color(fontGrey).make(),
                value: dropdown.value == "" ? null : dropdown.value,
                isExpanded: true,
                items: list.map((e){
                  return DropdownMenuItem(
                    child: e.toString().text.make(),
                    value: e, );
    
                }).toList(),
                onChanged: (value) {
                  if(hint == "category"){
                    controller.subcategoryvalue.value =  '';
                    controller.populatesubcategory(value.toString());
                  }
                  dropdown.value = value.toString();
    
    
                }))
        .box
        .roundedSM
        .white
        .padding(const EdgeInsets.symmetric(horizontal: 4))
        .make(),
  );
}

