import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:internshipapp/common/widgets/success_screen/success_screen.dart';
import 'package:internshipapp/utils/popups/loaders.dart';

import '../../../../data/repositories/authentication_repo.dart';
import '../../../../utils/constants/text_strings.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  //Send email verification
  @override
  void onInit() {
    sendEmailVerification();
    sendTimerForAutoRedirect();
    super.onInit();
  }

  // Repeat Email Verification Timer
  sendTimerForAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(
            () => SuccessScreen(
              image: '',
              title: TTexts.yourAccountCreatedTitle,
              subtitle: TTexts.yourAccountCreatedSubTitle,
              onPressed: AuthenticationRepository.instance.screenRedirect(),
            ),
          );
        }
      },
    );
  }

  // Send Email
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Please Check your Inbox and Verify your email.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap !!', message: e.toString());
    }
  }

  //Check Email Verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: '',
          title: TTexts.yourAccountCreatedTitle,
          subtitle: TTexts.yourAccountCreatedSubTitle,
          onPressed: AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}
