import 'package:e_seller_app/Screen/productScreen/add_product.dart';
import 'package:e_seller_app/Screen/productScreen/product_detail.dart';
import 'package:e_seller_app/comman_widget/appbar.dart';
import 'package:e_seller_app/const/const.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarbutton(product),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
              children: List.generate(
                  20,
                  (index) => Card(
                    child: ListTile(
                        onTap: () {
                          Get.to(()=> const ProductDetail());
                        },
                        leading: Image.asset(
                          imgproduct,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                        title: "Product title".text.color(darkGrey).make(),
                        subtitle:Row(
                          children: [
                            "Featured".text.color(green).make(),
                             "\$40".text.color(fontGrey).make(),
                          ],
                        ),
                        trailing: VxPopupMenu(
                          menuBuilder: () => Column(
                              children: List.generate(
                                  popmanuiconlist.length,
                                  (index) => Padding(
                                    
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                          children: [
                                            Icon(popmanuiconlist[index]),
                                            10.widthBox,
                                            Text(
                                              popmanustringlist[index],
                                              selectionColor: fontGrey,
                                            )
                                          ],
                                        ).onTap(() { })
                                  ))
                                      
                                      ).box.white.rounded.width(200).make(),
                          clickType: VxClickType.singleClick,
                          child: const Icon(Icons.more_vert_outlined),
                        )),
                  ))
                  )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        onPressed: () {
          Get.to(()=> const AddProduct());
        },
        child: const Icon(
          Icons.add,
          color: white,
          size: 20,
        ),
      ),
    );
  }
}
