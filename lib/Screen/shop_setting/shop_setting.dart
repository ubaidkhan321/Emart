import 'package:e_seller_app/comman_widget/customtextformfield.dart';
import 'package:e_seller_app/const/const.dart';
import 'package:get/get.dart';

class ShopSetting extends StatelessWidget {
  const ShopSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: const Icon(Icons.arrow_back,color: white,)),
        backgroundColor: purpleColor,
        title: "Shop Setting".text.white.make(),
        actions: [
          TextButton(onPressed: () {}, child: "Save".text.white.make())
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            customtextfield(
                labelname: "Shop Name",
                hintname: "Shop name",
                icon: const Icon(Icons.shop),
                isdense: false),
            10.heightBox,
            customtextfield(
                labelname: "Shop Mobile",
                hintname: "shop Mobile",
                icon: const Icon(Icons.phone),
                isdense: false),
            10.heightBox,
            customtextfield(
                labelname: "Website",
                hintname: "Website",
                icon: const Icon(Icons.web_stories),
                isdense: false),
            10.heightBox,
            customtextfield(
                labelname: "Description",
                hintname: "Description",
                icon: const Icon(Icons.description),
                isdense: true),
            10.heightBox,
          ],
        ),
      ),
    );
  }
}
