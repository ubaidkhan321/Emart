import 'package:e_seller_app/const/const.dart';
import 'package:get/get.dart';

class ProductDetail extends StatelessWidget {

 final dynamic data;
  const ProductDetail({super.key,
  this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "${data["p_name"]}".text.make(),
        leading:
            IconButton(onPressed: () {
              Get.back();
            }, icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VxSwiper.builder(
                  height: 350,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  itemCount: data["p_img"].length,
                  itemBuilder: (context, index) {
                    return Image.network(
                      data["p_img"][index],
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  }),
              10.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  "${data["p_name"]}".text.fontWeight(FontWeight.bold).make(),
                  VxRating(
                      size: 25,
                      maxRating: 5,
                      normalColor: fontGrey,
                      value: double.parse(data['p_rating']),
                      isSelectable: false,
                      selectionColor: Colors.yellow,
                      count: 5,
                      onRatingUpdate: (value) {}),
                  "${data["p_price"]}".numCurrency.text.color(red).fontWeight(FontWeight.bold).size(18).make(),
                  20.heightBox,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Color".text.color(darkGrey).make(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                                data['p_color'].length,
                                (index) => VxBox()
                                    .size(40, 40)
                                    .roundedFull
                                    .color(Color(data['p_color'][index]))
                                    .margin(const EdgeInsets.symmetric(
                                        horizontal: 6))
                                    .make()
                                    .onTap(() {})),
                          )
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Quantity".text.color(darkGrey).make(),
                          ),
                          "${data['p_qunatity']} item".text.color(fontGrey).make(),
                        ],
                      )
                    ],
                  ).box.white.padding( const EdgeInsets.all(8)).make(),
                  const Divider(),
                  10.heightBox,
                  "description".text.color(fontGrey).make(),
                  10.heightBox,
                  "This is my uniques product and have good quality should you feel good to wear my brand".text.make(),
                ],
                
              )
            ],
          ),
        ),
      ),
    );
  }
}
