import 'package:e_seller_app/Auth/Home_screen.dart';
import 'package:e_seller_app/Screen/controller/Home_controller.dart';
import 'package:e_seller_app/Screen/orderScreen/orderScreen.dart';
import 'package:e_seller_app/Screen/productScreen/productScreen.dart';
import 'package:e_seller_app/Screen/profilescreen/profileScreen.dart';
import 'package:e_seller_app/const/const.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(Homecontroller());
    var navbarScreen = [
    const HomeViewAuth(),
    const ProductScreen(),
   const  OrderScreen(),
    const ProfileScreen()
    ];
    var bottomnavbar = [
     const BottomNavigationBarItem(icon:  Icon(Icons.home),label: dashboard ),
     BottomNavigationBarItem(icon: Image.asset(icProduct,color:fontGrey,width: 24,),label: product ),
     BottomNavigationBarItem(icon: Image.asset(icOrder,width: 24,color: fontGrey,),label: orders),
     BottomNavigationBarItem(icon: Image.asset(icGeneralSetting,width: 24,color: fontGrey,),label: setting),


    ];
    return  Scaffold(
      bottomNavigationBar: Obx(()=>
         BottomNavigationBar(
          items: bottomnavbar,
          onTap: (index){
            controller.navindex.value = index;
            
          },
        type: BottomNavigationBarType.fixed,
        currentIndex: controller.navindex.value,
        selectedItemColor: red,
        unselectedItemColor: fontGrey,
        ),
      ),
      body: Obx(()=>
         Column(
          children: [
            Expanded(child: navbarScreen.elementAt(controller.navindex.value)),
        
          ],
        ),
      ),
    );
  }
}