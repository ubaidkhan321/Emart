
import 'package:e_seller_app/Screen/Message_Screen/chatScreen.dart';
import 'package:e_seller_app/const/const.dart';
import 'package:get/get.dart';


class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
         leading: IconButton(onPressed: (){
          Get.back();
        }, icon: const  Icon(Icons.arrow_back)),
       title: "Chat".text.make()
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            
            children: List.generate(20, (index) => ListTile(
              onTap: (){
                Get.to(()=> const ChatScreen());
              },
              
              leading: const CircleAvatar(
                radius: 25,
                backgroundColor: purpleColor,
                child: Icon(Icons.person,color: white,size: 25,),
              ),
              title: "Username".text.color(darkGrey).make(),
              subtitle: "last Message".text.color(darkGrey).make(),
              trailing: "10.45 PM".text.color(darkGrey).make(),
            )),
          ),
        ),
      ),
    );
  }
}