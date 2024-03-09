import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshipapp/data/repositories/authentication_repo.dart';
import 'package:internshipapp/data/repositories/user_repo.dart';
import 'package:internshipapp/features/authentication/screens/signup/email_verification.dart';
import 'package:internshipapp/features/personalization/models/user_model.dart';
import 'package:internshipapp/utils/helpers/network_manager.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  final privacyPolicy = false.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information ...', TImages.docerAnimation);

      //Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      //Form Validation
      if (!signupFormKey.currentState!.validate()) {
        return;
      }

      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Priacy Policy',
            message:
                'In order to create an account accept the privacy policy & terms of use');
      } else {
        // Authentication
        final userCredentials = await AuthenticationRepository.instance
            .registerWithEmailAndPassword(
                email.text.trim(), password.text.trim());

        final newUser = UserModel(
            id: userCredentials.user!.uid,
            firstName: firstName.text.trim(),
            lastName: lastName.text.trim(),
            email: email.text.trim(),
            phoneNumber: phoneNumber.text.trim(),
            profilePicture: '');

        final userRepository = Get.put(UserRepository());
        userRepository.saveUserRecord(newUser);
        // Show Success Message
        TLoaders.successSnackBar(
            title: 'SignUp !!', message: 'Your account has been created! ');
        // Move to Verify Email
        Get.to(() => VerifyEmailScreen(
              email: email.text.trim(),
            ));
      }

      //Move to Verify Email Screen
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }
}
