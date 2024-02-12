
import 'package:e_seller_app/const/const.dart';

class StoreSellerService{

static getprofile({uid}){
 return firestore.collection(vendorcollection).where('id',isEqualTo: uid).snapshots();

}


static getallmessage({uid}){
  return firestore.collection(chatcollection).where('to_id',isEqualTo: uid).snapshots();
}
static getorder({uid}){
  return firestore.collection(ordercollection).where('vendor',arrayContains: uid).snapshots();


}
static getallproduct({docuid}){
  return firestore.collection(productcollection).where("vendor_id",isEqualTo: docuid).snapshots();

}


static getpopulataedata(uid){
  return firestore.collection(productcollection).where('vendor_id',isEqualTo:  uid).orderBy('p_Wishlist'.length);
}

}