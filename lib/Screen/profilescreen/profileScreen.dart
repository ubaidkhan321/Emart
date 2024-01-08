import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_seller_app/Auth/LoginView.dart';
import 'package:e_seller_app/Screen/Message_Screen/Message.dart';
import 'package:e_seller_app/Screen/controller/profile_controller.dart';
import 'package:e_seller_app/Screen/profilescreen/edit_profile.dart';
import 'package:e_seller_app/Screen/shop_setting/shop_setting.dart';
import 'package:e_seller_app/Services/seller_service.dart';
import 'package:e_seller_app/const/const.dart';
import 'package:get/get.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileConroller());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: "Setting".text.make(),
        actions: [
          IconButton(onPressed: (){
            Get.to(()=> const EditProfile());
          }, icon: const Icon(Icons.edit)),
          TextButton(onPressed: (){}, child: "Logout".text.make())
        ],
      ),
      body: StreamBuilder(
        stream: StoreSellerService.getprofile(uid: currentuser!.uid), 
        builder: ( BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData){
              return Center(child: CircularProgressIndicator(strokeWidth: 1,color: Vx.randomPrimaryColor,));

            }
            else if (snapshot.data!.docs.isEmpty){
              return "Docs is Empty".text.make();

            }
            else{
              controller.snapshot =snapshot.data!.docs[0];
            return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            
            
            children: [
              
              ListTile(
                leading: const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(icProduct),
          
                ),
                title: "${controller.snapshot['name']}".text.white.make(),
                subtitle: "${controller.snapshot['email']}".text.white.make(),
              ),
              20.heightBox,
              Column(
                children:List.generate(showprofileicon.length, (index) => ListTile(
                  onTap: () {
                    switch(index){
                      case 0:
                      Get.to(()=> const ShopSetting());
                      break;
                      case 1:
                      Get.to(()=> const MessageScreen());
                      break;
                      case 2:
                      Get.offAll( const LoginView());
                      break;
                    }
                  },
                  leading: Icon(showprofileicon[index],color: white,),
                  title: Text(showprofilestring[index],style: const TextStyle(color: white),),
                )),
              ),
              10.heightBox,
               const Divider(),
              
            ],
          ),
        ),
      );
            }
 
        })
    );
  }
}