import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_seller_app/Screen/controller/product_controller.dart';
import 'package:e_seller_app/Screen/productScreen/add_product.dart';
import 'package:e_seller_app/Screen/productScreen/product_detail.dart';
import 'package:e_seller_app/Services/seller_service.dart';
import 'package:e_seller_app/comman_widget/appbar.dart';
import 'package:e_seller_app/const/const.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(Productcontroller());
    return Scaffold(
      appBar: appbarbutton(product),
      body: StreamBuilder(
        
        stream: StoreSellerService.getallproduct(docuid: currentuser!.uid), 
        builder: (context,AsyncSnapshot<QuerySnapshot>  snapshot){
          if(!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(color: purpleColor,),
            );
          }
          var data = snapshot.data!.docs;
         
          
          return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
              children: List.generate(
                  data.length,
                  (i) => Card(
                    child: ListTile(
                        onTap: () {
                          Get.to(()=>  ProductDetail(data: data[i],));
                        },
                        leading: Image.network(
                          data[i]['p_img'][0],
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                        title: "${data[i]["p_name"]}".text.color(darkGrey).make(),
                        subtitle:Row(
                          children: [
                           data[i]['p_futured'] == true ? "Featured".text.color(green).make() : "".text.make(),
                           10.widthBox,
                             "${data[i]['p_price']}".text.color(fontGrey).make(),
                          ],
                        ),
                        trailing: VxPopupMenu(
                          menuBuilder: () => Column(
                              children: List.generate(
                                  popmanuiconlist.length,
                                  (i) => Padding(
                                    
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                          children: [
                                            Icon(popmanuiconlist[i]),
                                            10.widthBox,
                                            Text(
                                              popmanustringlist[i],
                                              
                                              selectionColor: data[i]['featured_id'] == currentuser!.uid && i == 0 ? Colors.green : darkGrey,
                                            )
                                          ],
                                        ).onTap(() { 
                                          if(data[i]['p_futured'] == true){
                                            controller.removefeatured(data[i].id);
                                         
                                          }else{
                                            controller.addfeatured(data[i].id);
                                          }

                                        })
                                  ))
                                      
                                      ).box.white.rounded.width(200).make(),
                          clickType: VxClickType.singleClick,
                          child: const Icon(Icons.more_vert_outlined),
                        )),
                  ))
                  )
        ),
      );
      
          

        }),
        floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        onPressed: () async {
          await controller.getcategory();
          controller.populatecategory();
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
