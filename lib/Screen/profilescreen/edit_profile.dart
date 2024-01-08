import 'package:e_seller_app/comman_widget/customtextformfield.dart';
import 'package:e_seller_app/const/const.dart';


class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: purpleColor,
      appBar: AppBar(
        backgroundColor: purpleColor,
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back,color: white,)),
        
        title: "Edit profile".text.white.make(),
        actions: [
          TextButton(onPressed: (){}, child: "Save".text.white.make())
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            20.heightBox,
            
          Image.asset(imgproduct,width: 150,).box.roundedFull.clip(Clip.antiAlias).make(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: white
            ),
            onPressed: (){}, child: "Change Image".text.make()),
            10.heightBox,
           const  Divider(),
            20.heightBox,
            customtextfield(hintname: username,labelname:username,icon: const Icon(Icons.person,color: white,)),
               customtextfield(hintname: password,labelname:password,icon: const Icon(Icons.lock,color: white,)),
               customtextfield(hintname: password,labelname:password,icon: const Icon(Icons.lock,color: white,)),
              
           
          ],
        ),
      ),
    );
  }
}