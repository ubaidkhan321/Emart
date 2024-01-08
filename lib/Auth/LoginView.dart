import 'package:e_seller_app/Screen/HomeScreen.dart';
import 'package:e_seller_app/Screen/controller/Auth_controller.dart';
import 'package:e_seller_app/comman_widget/button.dart';
import 'package:e_seller_app/const/const.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: purpleColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              welcome.text.size(18).white.make(),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    icLogo,
                    width: 70,
                    height: 70,
                  )
                      .box
                      .border(color: white)
                      .roundedSM
                      .padding(const EdgeInsets.all(8))
                      .make(),
                  10.widthBox,
                  appname.text.fontWeight(FontWeight.bold).size(20).white.make()
                ],
              ),
              20.heightBox,
              Obx(()=>
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    email.text.color(red).size(18).make(),
                    TextFormField(
                      controller: controller.emailcontroller,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.withOpacity(0.3),
                          filled: true,
                          hintText: selleremail,
                          hintStyle: const TextStyle(
                            color: fontGrey,
                          ),
                          border: InputBorder.none,
                          suffixIcon: const Icon(Icons.email),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: red))),
                    ),
                    5.heightBox,
                    password.text.size(18).color(red).make(),
                    TextFormField(
                      controller: controller.passwordcontroller,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.withOpacity(0.3),
                          filled: true,
                          hintText: passwordhint,
                          hintStyle: const TextStyle(
                            color: fontGrey,
                          ),
                          border: InputBorder.none,
                          suffixIcon: const Icon(Icons.lock),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: red))),
                    ),
                    20.heightBox,
                    controller.isloading.value
                        ? const Center(
                          child:  CircularProgressIndicator(
                              color:purpleColor,
                              strokeWidth: 1,
                            ),
                        )
                        : ourbutton(
                            title: login,
                            onpress: () async {
                              controller.isloading(true);
                
                              await controller
                                  .islogin(
                                      email: controller.emailcontroller.text,
                                      password:
                                          controller.passwordcontroller.text)
                                  .then((value) {
                                if (value != null) {
                                  VxToast.show(context, msg: "Login");
                                  Get.to(() => const HomeScreen());
                                  controller.isloading(false);
                                } else {
                                  controller.isloading(false);
                                }
                              });
                            }),
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: forgotPassword.text.color(red).make()))
                  ],
                )
                    .box
                    .padding(const EdgeInsets.all(8))
                    .rounded
                    .outerShadow
                    .white
                    .make(),
              ),
              20.heightBox,
              anyProblem.text.white.makeCentered(),
              const Spacer(),
              credit.text.size(18).white.makeCentered(),
              10.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
