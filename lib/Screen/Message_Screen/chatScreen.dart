
import 'package:e_seller_app/Screen/Message_Screen/component/ChatBubble/chatbubble.dart';
import 'package:e_seller_app/const/const.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: const  Icon(Icons.arrow_back)),
        title: chat.text.make(),

      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context,index){
              return sellerchatbubble();

          })),
          10.heightBox,
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  
                  decoration:const InputDecoration(
                    isDense: true,
                    hintText:  "Enter Message",
                    border:OutlineInputBorder(
                    borderSide: BorderSide(
                      color: fontGrey, 
                    )
                      
                    ),
                  ),
                ),
                
              ),
              IconButton(onPressed: (){}, icon: const Icon(Icons.send,color: purpleColor,))
            ],
          ).box.padding( const EdgeInsets.all(12)).make()
        ],
      ),
    );
  }
}