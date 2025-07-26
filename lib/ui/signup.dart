import 'package:bartr/const/consts.dart';
import 'package:bartr/ui/products.dart';
import 'package:bartr/widgets/round_button.dart';
import '../controllers/signup_controller.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/label_textField.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SignupController());
    return Scaffold(
      backgroundColor: fontWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Obx(
            () => Form(
              key: controller.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  80.heightBox,
                  labelTextField(title: firstAndLastName),
                  5.heightBox,
                  CustomTextField(
                    hintText: yourFirstAndLastName,
                    controller: controller.nameController,
                  ),
                  15.heightBox,
                  labelTextField(title: email),
                  5.heightBox,
                  CustomTextField(
                    hintText: yourEmailAddress,
                    isEmail: true,
                    controller: controller.emailController,
                  ),
                  15.heightBox,
                  labelTextField(title: password),
                  5.heightBox,
                  CustomTextField(
                    hintText: password,
                    isPassword: true,
                    controller: controller.passwordController,
                  ),
                  15.heightBox,
                  labelTextField(title: confirmPassword),
                  5.heightBox,
                  CustomTextField(
                    hintText: reenterPassword,
                    isPassword: true,
                    controller: controller.confirmPasswordController,
                  ),
                  15.heightBox,
                  15.heightBox,
                  labelTextField(title: location),
                  5.heightBox,
                  RoundButton(
                    title: shareLocation,
                    titleColor: fontWhite,
                    height: 64.0,
                    fontSize: 18.0,
                    color: fontBlue,
                    enabledBorder: false,
                    ontap: () {},
                  ),
                  40.heightBox,
                  Center(
                    child: RoundButton(
                      title: signUp,
                      titleColor:
                          controller.isFormValid.value ? fontWhite : fontBlack,
                      height: 64.0,
                      width: 265.0,
                      fontSize: 18.0,
                      color:
                          controller.isFormValid.value
                              ? fontBlue
                              : Colors.transparent,
                      enabledBorder:
                          controller.isFormValid.value ? false : true,
                        ontap: () {
                          controller.handleSignup(context);
                        },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
