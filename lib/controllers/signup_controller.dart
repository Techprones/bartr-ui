import 'package:bartr/const/consts.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../ui/products.dart';

class SignupController extends GetxController {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  var isPasswordMatched = false.obs;
  var isFormValid = false.obs;
  late GlobalKey<FormState> formKey;

  // Add these visibility variables
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    formKey = GlobalKey<FormState>();
    passwordController.addListener(validateForm);
    confirmPasswordController.addListener(validateForm);
    emailController.addListener(validateForm);
    nameController.addListener(validateForm);
  }

  void validateForm() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (formKey.currentState != null) {
        isFormValid.value = formKey.currentState!.validate();
      }
    });
  }

  // Add these toggle methods
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

// signup method

  Future<UserCredential?> signupMethod({email, password, context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }
  void handleSignup(BuildContext context) async {
    if (isFormValid.value) {
      await signupMethod(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        context: context,
      );
      VxToast.show(context, msg: "User registered successfully!");

      if (currentUser != null) {
        Get.offAll(() => Products(),
            transition: Transition.fadeIn, duration: Duration(milliseconds: 500));
      } else {
        VxToast.show(context, msg: "User not registered");
      }
    } else {
      VxToast.show(context,
          msg: "Please fill the form correctly", bgColor: Colors.red);
    }
  }

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    nameController.dispose();
    super.onClose();
  }
}