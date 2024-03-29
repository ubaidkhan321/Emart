import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_seller_app/const/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';

class ProfileConroller extends GetxController {
  late QueryDocumentSnapshot snapshot;
  var imgepath = ''.obs;
  var isloading = false.obs;
  var profileimagelink = '';

  final name = TextEditingController();
  final password = TextEditingController();
  final oldpassword = TextEditingController();



  final shopname = TextEditingController();
  final shopmobile = TextEditingController();
  final shopwebsite = TextEditingController();
  final shopdescription = TextEditingController();
  final shopaddress = TextEditingController();


  changeimage({context}) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 100);
      if (img == null) return;
      imgepath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadImage() async {
    var filename = basename(imgepath.value);
    var destination = 'images/${currentuser!.uid}/$filename';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(imgepath.value));
    profileimagelink = await ref.getDownloadURL();
  }

  updatedata({name, password, imgurl, }) async {
    var store = firestore.collection(vendorcollection).doc(currentuser!.uid);
    await store.set({
      'name': name,
      'password': password,
      'imageurl': imgurl,
    }, SetOptions(merge: true));
    isloading(false);
  }

  changepassword({email, password, retypassword}) async {
    final cred = EmailAuthProvider.credential(email: email, password: password);
    //Login with new password.....................................................................
    await currentuser!.reauthenticateWithCredential(cred).then((value) {
      currentuser!.updatePassword(retypassword);
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
     
     shopupdate({shopname,shopmobile,shopwebsite,shopdescription,shopaddress})async{
       var store = firestore.collection(vendorcollection).doc(currentuser!.uid);
    await store.set({
     'shop_name':shopname,
     'shop_address':shopaddress,
     'shop_mobile':shopmobile,
     'shop_website': shopwebsite,
     'shop_description':shopdescription,
    }, SetOptions(merge: true));
    isloading(false);


     }














}
