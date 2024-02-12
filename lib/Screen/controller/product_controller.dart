import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_seller_app/Model/category.dart';
import 'package:e_seller_app/Screen/controller/Home_controller.dart';
import 'package:e_seller_app/const/const.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class Productcontroller extends GetxController {
  final namecontoller = TextEditingController();
  final deccontroller = TextEditingController();
  final pricecontoller = TextEditingController();
  final quncontroller = TextEditingController();

  var isloading = false.obs;

  var categorylist = <String>[].obs;
  var subcategorylist = <String>[].obs;
  var pimagelink = [];
  List<Category> category = [];
  var imgcategorylist = RxList<dynamic>.generate(3, (index) => null);

  var categoryvalue = "".obs;
  var subcategoryvalue = "".obs;
  var selectedindexvalue = 0.obs;

  getcategory() async {
    var data = await rootBundle.loadString("lib/Services/catefory_model.json");
    var cat = categoryModelFromJson(data);
    category = cat.category;
  }

  populatecategory() {
    categorylist.clear();
    for (var item in category) {
      categorylist.add(item.name);
    }
  }

  populatesubcategory(cat) {
    subcategorylist.clear();
    var data = category.where((element) => element.name == cat).toList();

    for (var i = 0; i < data.first.subcategory.length; i++) {
      subcategorylist.add(data.first.subcategory[i]);
    }
  }

  pickImage(index, context) async {
    try {
      var img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 80);
      if (img == null) {
        return;
      } else {
        imgcategorylist[index] = File(img.path);
      }
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadimages() async {
    pimagelink.clear();
    for (var item in imgcategorylist) {

      if (item != null) {
        var filename = basename(item.path);
        var destination = 'images/vendor/${currentuser!.uid}/$filename';
        Reference ref = FirebaseStorage.instance.ref().child(destination);
        await ref.putFile(item);
        var n = await ref.getDownloadURL();
        pimagelink.add(n);
      }
    }
  }

  uploadproduct({context}) async{
    var store = firestore.collection(productcollection).doc();
    await store.set({
    'p_futured': false,
    'p_category': categoryvalue.value,
    'P_subcat': subcategoryvalue.value,
    'p_color': FieldValue.arrayUnion([Colors.black.value,Colors.white.value,Colors.yellow.value]),
    'featured_id': '',
    'p_Wishlist':FieldValue.arrayUnion([]),
    'p_dis': deccontroller.text,
    'p_name': namecontoller.text,
    'p_price':pricecontoller.text,
    'p_img': FieldValue.arrayUnion(pimagelink),
    'p_qunatity': quncontroller.text,
    'p_rating': "5.0",
    'p_seller': Get.find<Homecontroller>().username,
    'vendor_id': currentuser!.uid,



    });
    isloading(false);
    VxToast.show(context, msg: "Product Uploaded");
  }

  addfeatured(docid)async{
   await firestore.collection(productcollection).doc(docid).set({
    'featured_id' : currentuser!.uid,
    'p_futured':true,

  },SetOptions(merge: true));
}

removefeatured(docid)async{
   await firestore.collection(productcollection).doc(docid).set({
    'featured_id' : '',
    'p_futured':false,

  },SetOptions(merge: true));
}
}
