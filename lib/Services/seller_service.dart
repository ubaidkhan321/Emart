
import 'package:e_seller_app/const/const.dart';

class StoreSellerService{

static getprofile({uid}){
 return firestore.collection(vendorcollection).where('id',isEqualTo: uid).snapshots();

}


static getallmessage({uid}){
  return firestore.collection(chatcollection).where('to_id',isEqualTo: uid).snapshots();
}

}