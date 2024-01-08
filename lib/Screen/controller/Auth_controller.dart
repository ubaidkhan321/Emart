
import 'package:e_seller_app/const/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
   var isloading = false.obs;
   final emailcontroller = TextEditingController();
   final passwordcontroller = TextEditingController();

  Future<UserCredential?> islogin({email,password,context})async{
    UserCredential? usercredential;

    try{
      usercredential = await  auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
    }
    return usercredential;

  }


  signout({context})async{
    try{
     await auth.signOut();

    }on FirebaseAuthException catch (e){
      VxToast.show(context, msg: e.toString());
    }
  }


}