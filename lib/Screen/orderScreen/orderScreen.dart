import 'package:e_seller_app/Screen/orderScreen/order_Details/orderdetails.dart';
import 'package:e_seller_app/comman_widget/appbar.dart';
import 'package:e_seller_app/const/const.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'as intl;


class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarbutton("Orders"),
      body: SingleChildScrollView(
        child: Column(
           children: List.generate(20, (index) =>  Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
            ),
             child: ListTile(
               
                      onTap: (){

                        Get.to(()=> const OrderDetails());
                      },
                      
                      
                      
                      title: "03132094024".text.color(fontGrey).make(),
                      subtitle: Column(
                        children: [
                          Row(
                            children: [
                             const Icon(Icons.calendar_month,color: fontGrey,),
                             10.widthBox,
                              Text(intl.DateFormat().add_yMd().format(DateTime.now()))
                              
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
                      trailing: "\$40.0".text.color(fontGrey).make(),
                    ),
           ))),
      ),
    );
  }
}