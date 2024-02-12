import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_seller_app/Screen/controller/order_controller.dart';
import 'package:e_seller_app/Screen/orderScreen/order_Details/orderdetails.dart';
import 'package:e_seller_app/Services/seller_service.dart';
import 'package:e_seller_app/comman_widget/appbar.dart';
import 'package:e_seller_app/const/const.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'as intl;


class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(Ordercontroler());
    return Scaffold(
      appBar: appbarbutton("Orders"),
      body: StreamBuilder(
        stream: StoreSellerService.getorder(uid: currentuser!.uid) ,
         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(color: purpleColor,strokeWidth: 1,),
            );


          }
          else{
            var data = snapshot.data!.docs;
            return
            SingleChildScrollView(
        child: Column(
           children: List.generate(data.length, (index) {
            var time = data[index]['order_date'].toDate();
            return  Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
            ),
             child: ListTile(
               
                      onTap: (){

                        Get.to(()=>  OrderDetails(data: data[index],));
                      },
                      
                      
                      
                      title: "${data[index]['order_code']}".text.color(fontGrey).make(),
                      subtitle: Column(
                        children: [
                          Row(
                            children: [
                             const Icon(Icons.calendar_month,color: fontGrey,),
                             10.widthBox,
                              Text(intl.DateFormat().add_yMd().format(time))
                              
                            ],
                          ),
                          Row(
                            children: [
                             const Icon(Icons.money,color: fontGrey,),
                             10.widthBox,
                              "Unpaied".text.color(red).make()
                              
                            ],
                          ),
                          
                        ],
                      ),
                      trailing: "\$${data[index]['total_amount']}".text.fontWeight(FontWeight.bold).make(),
                    ),
           );
           }
           )
           )
           ,
      );
          }



         })
    );
  }
}