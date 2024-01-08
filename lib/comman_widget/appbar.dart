import 'package:e_seller_app/const/const.dart';
import 'package:intl/intl.dart' as intl;

AppBar appbarbutton(title){
 return AppBar(
  backgroundColor: white,
        automaticallyImplyLeading: false,
       title: "$title".text.color(fontGrey).make(),
       actions: [
        Text(intl.DateFormat("EEE, MMM d, ''yy" ).format(DateTime.now())),
        10.widthBox,
       ],
      );

}