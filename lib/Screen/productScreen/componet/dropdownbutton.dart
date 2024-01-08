import 'package:e_seller_app/const/const.dart';

Widget dropdownbutton() {
  return DropdownButtonHideUnderline(
          child: DropdownButton<String>(
              hint: "Select Category".text.color(fontGrey).make(),
              value: null,
              isExpanded: true,
              items: const [],
              onChanged: (value) {}))
      .box
      .roundedSM
      .white
      .padding(const EdgeInsets.symmetric(horizontal: 4))
      .make();
}

