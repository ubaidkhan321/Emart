
import 'package:e_seller_app/comman_widget/DashboardButton.dart';
import 'package:e_seller_app/comman_widget/appbar.dart';
import 'package:e_seller_app/const/const.dart';



class HomeViewAuth extends StatelessWidget {
  const HomeViewAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarbutton("Dashboard"),
      
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashboardbutton(context,title: product,count: "75",icon: icProduct),
                dashboardbutton(context,title: orders,count: "20",icon: icOrder)
              ],
             ),
             10.heightBox,
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashboardbutton(context,title: rating,count: "4",icon: icStar),
                dashboardbutton(context,title: totalsale,count: "60", icon:  icProduct),
              ],
             ),
             10.heightBox,
             popularproduct.text.color(darkGrey).make(),
              20.heightBox,
              ListView(
                
                shrinkWrap: true,
                children: List.generate(3, (index) => ListTile(
                  onTap: (){},
                  leading: Image.asset(imgproduct,width: 80,height: 80,fit: BoxFit.cover,),
                  title: "Product title".text.color(darkGrey).make(),
                  subtitle: "\$40".text.color(fontGrey).make(),
                )),
              )
          
            ],
          ),
        ),
      ),
    );
  }
}