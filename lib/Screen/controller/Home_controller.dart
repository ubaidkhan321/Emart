
import 'package:e_seller_app/const/const.dart';
import 'package:get/get.dart';

class Homecontroller extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getusername();
  }
  var navindex = 0.obs;

  var username = '';

  getusername()async {
    var n = await firestore
        .collection(vendorcollection)
        .where('id', isEqualTo: currentuser!.uid)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        return value.docs.single['name'];
      }
    });
    username = n;
   
    
  }
  
}
