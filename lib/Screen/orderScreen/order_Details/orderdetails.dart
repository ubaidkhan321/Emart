import 'package:e_seller_app/Screen/controller/order_controller.dart';
import 'package:e_seller_app/Screen/orderScreen/component/orderplaceDetail.dart';
import 'package:e_seller_app/comman_widget/button.dart';
import 'package:e_seller_app/const/const.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

class OrderDetails extends StatefulWidget {
  final dynamic data;
  const OrderDetails({super.key, this.data});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  var controller = Get.find<Ordercontroler>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getorder(data: widget.data);
    controller.confirmvalue.value = widget.data['order_conform'];
    controller.deliveryvalue.value = widget.data['order_on_delivery'];
    controller.deliveredvalue.value = widget.data['order_delivered'];
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
          bottomNavigationBar: Visibility(
            visible: !controller.confirmvalue.value,
            child: SizedBox(
              width: context.screenWidth,
              height: 60,
              child: ourbutton(
                  title: "Comfirm Order",
                  onpress: () {
                    controller.confirmvalue(true);
                    controller.changestatus(title: "order_conform",status: true,docid: widget.data.id);
                  }),
            ),
          ),
          body: SingleChildScrollView(
            //order delvery status section.........
            child: Column(
              children: [
                Visibility(
                  visible: controller.confirmvalue.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Order Status".text.make(),
                      SwitchListTile(
                        activeColor: green,
                        value: true,
                        onChanged: (value) {},
                        title: "Place"
                            .text
                            .fontWeight(FontWeight.bold)
                            .color(darkGrey)
                            .make(),
                      ),
                      SwitchListTile(
                        activeColor: green,
                        value: controller.confirmvalue.value,
                        onChanged: (value) {
                          controller.confirmvalue.value = value;
                          controller.changestatus(title: "order_conform",status: value,docid: widget.data.id);
                        },
                        title: "Confirm"
                            .text
                            .fontWeight(FontWeight.bold)
                            .color(darkGrey)
                            .make(),
                      ),
                      
                      SwitchListTile(
                        activeColor: green,
                        value: controller.deliveryvalue.value,
                        onChanged: (value) {
                          controller.deliveryvalue.value = value;
                          controller.changestatus(title: "order_on_delivery",status: value,docid: widget.data.id);
                        },
                        title: "on Delivery"
                            .text
                            .fontWeight(FontWeight.bold)
                            .color(darkGrey)
                            .make(),
                      ),
                      SwitchListTile(
                        activeColor: green,
                        value: controller.deliveredvalue.value,
                        onChanged: (value) {
                          controller.deliveredvalue.value = value;
                          controller.changestatus(title: "order_delivered",status: value,docid: widget.data.id);
                        },
                        title: "on Delivered"
                            .text
                            .fontWeight(FontWeight.bold)
                            .color(darkGrey)
                            .make(),
                      ),
                    ],
                  )
                      .box
                      .roundedSM
                      .outerShadow
                      .white
                      .border(color: lightGrey)
                      .make(),
                ),

                //order detail section............
                Column(
                  children: [
                    orderplace(
                        t1: "Order Code",
                        t2: "Shipping Method",
                        d1: "${widget.data['order_code']}",
                        d2: "${widget.data['shipping_methode']}"),
                    orderplace(
                        t1: "Order date",
                        t2: "Payment Method",
                        d1: intl.DateFormat()
                            .add_yMd()
                            .format((widget.data['order_date'].toDate())),
                        d2: " ${widget.data['payment_methode']}"),
                    orderplace(
                        t1: "payment Status",
                        t2: "Delivery status",
                        d1: "Unpaid",
                        d2: 'Order Placed'),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Shipping Address".text.make(),
                              10.heightBox,
                              "${widget.data['order_by_name']}".text.make(),
                              "${widget.data['order_by_email']}".text.make(),
                              "${widget.data['order_by_address']}".text.make(),
                              "${widget.data['order_by_city']}".text.make(),
                              "${widget.data['order_by_state']}".text.make(),
                              "${widget.data['order_by_phone']}".text.make(),
                              "${widget.data['order_by_postal']}".text.make(),
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
                                "${widget.data['total_amount']}".text.make(),
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
                        children:
                            List.generate(controller.orderlist.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                orderplace(
                                  t1: "${controller.orderlist[index]['title']}",
                                  t2: "${controller.orderlist[index]['t_price']}",
                                  d1: "${controller.orderlist[index]['qty']}X",
                                  d2: "Refundable",
                                ),
                                Container(
                                    height: 20,
                                    width: 30,
                                    color: Color(
                                        controller.orderlist[index]['color'])),
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
          )),
    );
  }
}
