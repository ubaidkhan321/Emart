import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_seller_app/const/const.dart';
import 'package:get/get.dart';

class Ordercontroler extends GetxController {
  var orderlist = [];
  var confirmvalue = false.obs;
  var deliveryvalue = false.obs;
  var deliveredvalue = false.obs;

  getorder({data}) {
    orderlist.clear();
    for (var item in data['order']) {
      if (item['vendor_id'] == currentuser!.uid) {
        orderlist.add(item);
      }
    }
  }

  changestatus({docid, title, status}) async {
    var store = firestore.collection(ordercollection).doc(docid);
    await store.set({
      title: status,
    }, SetOptions(merge: true));
  }
}
