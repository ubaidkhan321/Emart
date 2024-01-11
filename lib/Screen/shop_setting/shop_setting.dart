import 'package:e_seller_app/Screen/controller/profile_controller.dart';
import 'package:e_seller_app/comman_widget/customtextformfield.dart';
import 'package:e_seller_app/const/const.dart';
import 'package:get/get.dart';

class ShopSetting extends StatelessWidget {
  const ShopSetting({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileConroller>();
    return Obx(()=>
       Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: purpleColor,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: white,
              )),
          backgroundColor: purpleColor,
          title: "Shop Setting".text.white.make(),
          actions: [
            controller.isloading.value
                ? const CircularProgressIndicator(color: white, strokeWidth: 1)
                : TextButton(
                    onPressed: () async{
                      if (controller.shopaddress.text.isEmptyOrNull &&
                          controller.shopname.text.isEmptyOrNull &&
                          controller.shopdescription.text.isEmptyOrNull) {
                        VxToast.show(context, msg: "Field is empty");
                      } else {
                        controller.isloading(true);
                       await controller.shopupdate(
                            shopname: controller.shopname.text,
                            shopaddress: controller.shopaddress.text,
                            shopmobile: controller.shopmobile.text,
                            shopwebsite: controller.shopwebsite.text,
                            shopdescription: controller.shopdescription.text);
                      }
                      VxToast.show(context, msg: "Update shop");
                      controller.shopname.clear();
                      controller.shopaddress.clear();
                      controller.shopmobile.clear();
                      controller.shopwebsite.clear();
                      controller.shopdescription.clear();
                      controller.isloading(false);
                    },
                    child: "Save".text.white.make())
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              customtextfield(
                  controller: controller.shopname,
                  labelname: "Shop Name",
                  hintname: "Shop name",
                  icon: const Icon(Icons.shop),
                  isdense: false),
              10.heightBox,
              customtextfield(
                  controller: controller.shopaddress,
                  labelname: "Shop Address",
                  hintname: "Shop Address",
                  icon: const Icon(Icons.home),
                  isdense: false),
              10.heightBox,
              customtextfield(
                  controller: controller.shopmobile,
                  labelname: "Shop Mobile",
                  hintname: "shop Mobile",
                  icon: const Icon(Icons.phone),
                  isdense: false),
              10.heightBox,
              customtextfield(
                  controller: controller.shopwebsite,
                  labelname: "Website",
                  hintname: "Website",
                  icon: const Icon(Icons.web_stories),
                  isdense: false),
              10.heightBox,
              customtextfield(
                  controller: controller.shopdescription,
                  labelname: "Description",
                  hintname: "Description",
                  icon: const Icon(Icons.description),
                  isdense: true),
              10.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
