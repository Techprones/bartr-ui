import 'package:bartr/const/consts.dart';

import '../controllers/signup_controller.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  var controller;
  final bool isPassword;
  final bool isEmail;

  CustomTextField({
  Key? key,
  required this.hintText,
  this.controller,
  this.isPassword = false,
  this.isEmail = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  if (!isPassword) {
  return TextFormField(
  controller: controller,
  obscureText: false,
  keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
  decoration: InputDecoration(
  isDense: true,
  suffixIcon: null,
  hintText: hintText,
  hintStyle: TextStyle(color: lightFontGrey, fontSize: 12),
  border: InputBorder.none,
  enabledBorder: UnderlineInputBorder(
  borderSide: BorderSide(width: 1, color: fontGrey),
  ),
  ),
  validator: (value) {
  if (value == null || value.isEmpty) {
  return 'This field is required';
  }
  if (isEmail && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
  return 'Enter a valid email';
  }
  return null;
  },
  );
  }

  final signupController = Get.find<SignupController>();

  return Obx(() {
  bool obscureText = true;
  VoidCallback? toggleVisibility;

  if (controller == signupController.passwordController) {
  obscureText = !signupController.isPasswordVisible.value;
  toggleVisibility = signupController.togglePasswordVisibility;
  } else if (controller == signupController.confirmPasswordController) {
  obscureText = !signupController.isConfirmPasswordVisible.value;
  toggleVisibility = signupController.toggleConfirmPasswordVisibility;
  }

  return TextFormField(
  controller: controller,
  obscureText: obscureText,
  keyboardType: TextInputType.text,
  decoration: InputDecoration(
  isDense: true,
  suffixIcon: IconButton(
  onPressed: toggleVisibility,
  icon: Icon(
  obscureText ? Icons.visibility : Icons.visibility_off_outlined,
  ),
  ),
  hintText: hintText,
  hintStyle: TextStyle(color: lightFontGrey, fontSize: 12),
  border: InputBorder.none,
  enabledBorder: UnderlineInputBorder(
  borderSide: BorderSide(width: 1, color: fontGrey),
  ),
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Enter Password';
    }
    if (
        value != signupController.passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  },
  );
  });
  }
}