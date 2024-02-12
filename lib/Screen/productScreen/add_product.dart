import 'package:e_seller_app/Screen/controller/product_controller.dart';
import 'package:e_seller_app/Screen/productScreen/componet/category_images.dart';
import 'package:e_seller_app/Screen/productScreen/componet/dropdownbutton.dart';
import 'package:e_seller_app/comman_widget/customtextformfield.dart';
import 'package:e_seller_app/const/const.dart';
import 'package:get/get.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
  
  var controller =  Get.find<Productcontroller>(); 
  
    return Obx(()=>
       Scaffold(
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
            controller.isloading.value ? const CircularProgressIndicator(color: red,strokeWidth: 1,) :
            TextButton(onPressed: ()async {
              controller.isloading(true);
              await controller.uploadimages();
              await controller.uploadproduct(context: context);
              Get.back();
      
      
      
            }, child: "Save".text.color(Colors.red).make())
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customtextfield(
                   controller: controller.namecontoller,
                    hintname: "product Name",
                    labelname: "product Name",
                    icon: const Icon(Icons.production_quantity_limits,),
                    isdense: false),
                10.heightBox,
                customtextfield(
                  controller: controller.deccontroller,
                    hintname: "Descripton",
                    labelname: "Description",
                    icon: const Icon(Icons.production_quantity_limits),
                    isdense: true),
                customtextfield(
                  controller: controller.pricecontoller,
                    hintname: "Price",
                    labelname: "Price",
                    icon: const Icon(Icons.production_quantity_limits),
                    isdense: false),
                customtextfield(
                  controller: controller.quncontroller,
                    hintname: "Quantity",
                    labelname: "Quantity",
                    icon: const Icon(Icons.production_quantity_limits),
                    isdense: false),
                10.heightBox,
                dropdownbutton("category", controller.categorylist, controller.categoryvalue,controller),
                10.heightBox,
                dropdownbutton("subcategory",controller.subcategorylist,controller.subcategoryvalue,controller),
                10.heightBox,
                Obx(()=>
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                        3, (index) => controller.imgcategorylist[index] != null ? Image.file(controller.imgcategorylist[index],height: 100,).box.clip(Clip.antiAlias).make().onTap(() {
                          controller.pickImage(index, context);
                        }) : categoryImages(label: "${index + 1}" ).onTap(() {
                          controller.pickImage(index, context);
                        })
                        
                        ),
                        
                            
                  ),
                ),
                10.heightBox,
                "First Image Should be Display on Seller Side".text.white.make(),
                Obx(()=>
                   Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: List.generate(12, (index) => Stack(
                      alignment: Alignment.center,
                      children: [
                        
                        VxBox().color(Vx.randomPrimaryColor).roundedFull.size(50, 50).make().onTap(() {
                         
                          controller.selectedindexvalue.value = index;
                        }),
                        controller.selectedindexvalue.value == index ?
                       const Icon(Icons.done,color: Colors.black,size: 20,) : const SizedBox()
                      ],
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
