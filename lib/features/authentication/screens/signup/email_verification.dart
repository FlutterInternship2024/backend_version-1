import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:internshipapp/data/repositories/authentication_repo.dart';
import 'package:internshipapp/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:internshipapp/utils/constants/text_strings.dart';

import '../../../../utils/constants/sizes.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
        appBar: AppBar(
          //Back arrow adjustment
          actions: [
            IconButton(
                onPressed: () => Get.offAll(
                    () => AuthenticationRepository.instance.logout()),
                icon: Icon(Icons.arrow_back))
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    //Image

                    // Title & SubTitle
                    Text(
                      TTexts.confirmEmail,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    Text(
                      email ?? '',
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    Text(
                      TTexts.confirmEmailSubTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    // Confirm Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () =>
                              controller.checkEmailVerificationStatus(),
                          child: const Text(TTexts.tContinue)),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    // Resend Button
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () => controller.sendEmailVerification(),
                          child: const Text(TTexts.resendEmail)),
                    )
                  ],
                ))));
  }
}
