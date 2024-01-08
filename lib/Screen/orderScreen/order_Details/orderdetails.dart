import 'package:e_seller_app/Screen/orderScreen/component/orderplaceDetail.dart';
import 'package:e_seller_app/comman_widget/button.dart';
import 'package:e_seller_app/const/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: "Order Details".text.color(fontGrey).make(),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: fontGrey,
              )),
        ),
        bottomNavigationBar: SizedBox(
          width: context.screenWidth,
          height: 60,
          child: ourbutton(title: "Comfirm Order", onpress: () {}),
        ),
        body: SingleChildScrollView(
          //order delvery status section.........
          child: Column(
            children: [
              Visibility(
               
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Order Status".text.make(),
                    SwitchListTile(
                      activeColor: green,
                      value: true,
                      onChanged: (value) {},
                      title: "Place".text.fontWeight(FontWeight.bold).color(darkGrey).make(),
                    ),
                       SwitchListTile(
                      activeColor: green,
                      value: true,
                      onChanged: (value) {},
                      title: "Confirm".text.fontWeight(FontWeight.bold).color(darkGrey).make(),
                    ),
                       SwitchListTile(
                      activeColor: green,
                      value: true,
                      onChanged: (value) {},
                      title: "on Delivery".text.fontWeight(FontWeight.bold).color(darkGrey).make(),
                    ),
                       SwitchListTile(
                      activeColor: green,
                      value: true,
                      onChanged: (value) {},
                      title: "on Delivered".text.fontWeight(FontWeight.bold).color(darkGrey).make(),
                    ),
                  ],
                ).box.roundedSM.outerShadow.white.border(color: lightGrey).make(),
              ),
        
              //order detail section............
              Column(
                children: [
                  orderplace(
                      t1: "Order Code",
                      t2: "Shipping Method",
                      d1: "data['order_code']",
                      d2: "data['shipping_methode']"),
                  orderplace(
                      t1: "Order date",
                      t2: "Payment Method",
                      d1: DateTime.now(),
                      // d1: intl.DateFormat()
                      //     .add_yMd()
                      //     .format((data['order_date'].toDate())),
                      d2: " data['payment_methode']"),
                  orderplace(
                      t1: "payment Status",
                      t2: "Delivery status",
                      d1: "Unpaid",
                      d2: 'Order Placed'),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Shipping Address".text.make(),
                            "{data['order_by_name']}".text.make(),
                            "{data['order_by_email']}".text.make(),
                            "{data['order_by_address']}".text.make(),
                            "{data['order_by_city']}".text.make(),
                            "{data['order_by_state']}".text.make(),
                            "{data['order_by_phone']}".text.make(),
                            "{data['order_by_postal']}".text.make(),
                          ],
                        ),
                        SizedBox(
                          width: 130,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              "Total Amount"
                                  .text
                                  .color(red)
                                  .fontWeight(FontWeight.bold)
                                  .make(),
                              "{data['total_amount']}".text.make(),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ).box.outerShadowMd.roundedSM.white.make(),
              10.heightBox,
              const Divider(),
              "Ordered Product".text.fontWeight(FontWeight.bold).make(),
              10.heightBox,
              ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(3, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              orderplace(
                                t1: "data['order'][index]['title']",
                                t2: "data['order'][index]['t_price']",
                                d1: "{data['order'][index]['qty']}X",
                                d2: "Refundable",
                              ),
                              Container(
                                  height: 20, width: 30, color: purpleColor),
                              const Divider()
                            ],
                          ),
                        );
                      }).toList())
                  .box
                  .shadowSm
                  .white
                  .margin(const EdgeInsets.only(bottom: 8))
                  .make()
            ],
          ),
        ));
  }
}
