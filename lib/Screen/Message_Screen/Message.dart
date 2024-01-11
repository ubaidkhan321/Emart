import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_seller_app/Screen/Message_Screen/chatScreen.dart';
import 'package:e_seller_app/Services/seller_service.dart';
import 'package:e_seller_app/const/const.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back)),
            title: "Chat".text.make()),
        body: StreamBuilder(
            stream: StoreSellerService.getallmessage(uid: currentuser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: white,
                    strokeAlign: 1,
                  ),
                );
              } else {
                var data = snapshot.data!.docs;
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: List.generate(data.length, (index) {
                        var t = data[index]['created_on'] == null
                            ? DateTime.now()
                            : data[index]['created_on'].toDate();
                        var time = intl.DateFormat("h:mma").format(t);
                        return ListTile(
                          onTap: () {
                            Get.to(() => const ChatScreen());
                          },
                          leading: const CircleAvatar(
                            radius: 25,
                            backgroundColor: purpleColor,
                            child: Icon(
                              Icons.person,
                              color: white,
                              size: 25,
                            ),
                          ),
                          title: "${data[index]['sender_name']}"
                              .text
                              .color(darkGrey)
                              .make(),
                          subtitle: "${data[index]['last_msg']}"
                              .text
                              .color(darkGrey)
                              .make(),
                          trailing: time.text.color(darkGrey).make(),
                        );
                      }),
                    ),
                  ),
                );
              }
            }));
  }
}
