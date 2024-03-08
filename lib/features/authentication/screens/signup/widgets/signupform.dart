import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:internshipapp/features/authentication/controllers/signup/signup_controller.dart';
import 'package:internshipapp/features/authentication/screens/signup/widgets/termscondition.dart';
import 'package:internshipapp/utils/validators/validation.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                    validator: (value) =>
                        TValidator.validateEmptyText('First Name', value),
                  ),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwInputFields,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastName,
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                    validator: (value) =>
                        TValidator.validateEmptyText('Last Name', value),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            //UserName
            TextFormField(
              controller: controller.username,
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit)),
              validator: (value) =>
                  TValidator.validateEmptyText('User Name', value),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            // Email
            TextFormField(
                controller: controller.email,
                expands: false,
                decoration: const InputDecoration(
                    labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
                validator: (value) => TValidator.validateEmail(value)),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            // Phone Number
            TextFormField(
              controller: controller.phoneNumber,
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
              validator: (value) => TValidator.validatePhoneNumber(value),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            // Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                expands: false,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    labelText: TTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye),
                    )),
                validator: (value) => TValidator.validatePassword(value),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            //Terms&Conditions Checkbox
            TermsConditions(),

            //Sign Up Button

            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.signup();
                  },
                  child: const Text(TTexts.createAccount),
                ))
          ],
        ));
  }
}
