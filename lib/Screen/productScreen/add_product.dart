import 'package:e_seller_app/Screen/productScreen/componet/category_images.dart';
import 'package:e_seller_app/Screen/productScreen/componet/dropdownbutton.dart';
import 'package:e_seller_app/comman_widget/customtextformfield.dart';
import 'package:e_seller_app/const/const.dart';
import 'package:get/get.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        title: " Add Product".text.make(),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        actions: [
          TextButton(onPressed: () {}, child: "Save".text.white.make())
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customtextfield(
                  hintname: "product Name",
                  labelname: "product Name",
                  icon: const Icon(Icons.production_quantity_limits),
                  isdense: false),
              10.heightBox,
              customtextfield(
                  hintname: "Descripton",
                  labelname: "Description",
                  icon: const Icon(Icons.production_quantity_limits),
                  isdense: true),
              customtextfield(
                  hintname: "Price",
                  labelname: "Price",
                  icon: const Icon(Icons.production_quantity_limits),
                  isdense: false),
              customtextfield(
                  hintname: "Quantity",
                  labelname: "Quantity",
                  icon: const Icon(Icons.production_quantity_limits),
                  isdense: false),
              10.heightBox,
              dropdownbutton(),
              10.heightBox,
              dropdownbutton(),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    3, (index) => categoryImages(label: "${index + 1}" )),
                    
          
              ),
              10.heightBox,
              "First Image Should be Display on Seller Side".text.white.make(),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List.generate(12, (index) => Stack(
                  alignment: Alignment.center,
                  children: [
                    
                    VxBox().color(Vx.randomPrimaryColor).roundedFull.size(50, 50).make(),
                   const Icon(Icons.done,color: white,)
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
