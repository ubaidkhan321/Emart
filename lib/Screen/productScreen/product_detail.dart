import 'package:e_seller_app/const/const.dart';
import 'package:get/get.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Product title".text.make(),
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
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      imgproduct,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  }),
              10.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Product Title".text.fontWeight(FontWeight.bold).make(),
                  VxRating(
                      size: 25,
                      maxRating: 5,
                      normalColor: fontGrey,
                      value: 3.0,
                      isSelectable: false,
                      selectionColor: Colors.yellow,
                      count: 5,
                      onRatingUpdate: (value) {}),
                  "\$300.0".text.color(red).size(18).make(),
                  20.heightBox,
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Color".text.color(darkGrey).make(),
                          ),
                          Row(
                            children: List.generate(
                                3,
                                (index) => VxBox()
                                    .size(40, 40)
                                    .roundedFull
                                    .color(Vx.randomPrimaryColor)
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
                          "20 Item".text.color(fontGrey).make(),
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
