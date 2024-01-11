import 'dart:io';

import 'package:e_seller_app/Screen/controller/profile_controller.dart';
import 'package:e_seller_app/comman_widget/customtextformfield.dart';
import 'package:e_seller_app/const/const.dart';
import 'package:get/get.dart';

class EditProfile extends StatefulWidget {
  final String? username;
  const EditProfile({super.key, this.username});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var controller = Get.find<ProfileConroller>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.name.text = widget.username!;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: purpleColor,
        appBar: AppBar(
          backgroundColor: purpleColor,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: white,
              )),
          title: "Edit profile".text.white.make(),
          actions: [
            controller.isloading.value ? const CircularProgressIndicator(color: white,strokeAlign: 1,) :
            TextButton(onPressed: () async {
      
      
                   controller.isloading(true);
                      //if user  want to change profile..
                      if(controller.imgepath.value.isNotEmpty){
                              await controller.uploadImage();
                      }
                      //if user not  want to change profile..
                      else{
                        controller.profileimagelink = controller.snapshot['imageurl'];
                      }
                       if (controller.password.text == controller.snapshot['password'])
                       {
                            await controller.changepassword(
                              email: controller.snapshot['email'],
                              password: controller.password.text,
                              retypassword: controller.oldpassword.text,
      
                            );
      
                         await controller.updatedata(
                        imgurl: controller.profileimagelink,
                         name: controller.name.text,
                         password: controller.oldpassword.text, );
                      VxToast.show(context, msg: "Update Profile");
                      controller.isloading(false);
                      controller.name.clear();
                      controller.password.clear();
                      controller.oldpassword.clear();
      
                       }
                       else if(controller.password.text.isEmptyOrNull && controller.oldpassword.text.isEmptyOrNull){
                        controller.isloading(true);
                        await controller.updatedata(
                        imgurl: controller.profileimagelink,
                         name: controller.name.text,
                         password: controller.snapshot['password'] );
                      VxToast.show(context, msg: "Update Profile");
                      controller.isloading(false);
                      controller.name.clear();
                      controller.password.clear();
                      controller.oldpassword.clear();
      
                       }
      
      
                       else{ 
                        VxToast.  show(context, msg: "Something Wrong");
                        controller.isloading(false);
                       }
      
      
            }, child: "Save".text.white.make())
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: 
             Column(
              children: [
                20.heightBox,
            
                // Image.asset(imgproduct,width: 150,).box.roundedFull.clip(Clip.antiAlias).make(),
                controller.snapshot['imageurl'] == '' && controller.imgepath.isEmpty
                    ? Image.asset(
                        imgproduct,
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    //if image  is not empty and controller is empty
                    : controller.snapshot['imageurl'] != '' &&
                            controller.imgepath.isEmpty
                        ? Image.network(
                            controller.snapshot['imageurl'],
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make()
                        //if both is empty.....
                        : Image.file(
                            File(controller.imgepath.value),
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: white),
                    onPressed: () {
                      controller.changeimage();
                    },
                    child: "Change Image".text.make()),
                10.heightBox,
                const Divider(),
                20.heightBox,
                customtextfield(
                    hintname: username,
                    labelname: username,
                    icon: const Icon(
                      Icons.person,
                      color: white,
                    ),
                    controller: controller.name),
                Align(
                  alignment: Alignment.centerLeft,
                  child: "Change Password".text.color(red).size(18).make(),
                ),
            
                customtextfield(
                    hintname: password,
                    labelname: password,
                    icon: const Icon(Icons.lock, color: white),
                    controller: controller.oldpassword),
                customtextfield(
                    hintname: password,
                    labelname: password,
                    icon: const Icon(
                      Icons.lock,
                      color: white,
                    ),
                    controller: controller.password),
              ],
            ),
          
        ),
      ),
    );
  }
}
