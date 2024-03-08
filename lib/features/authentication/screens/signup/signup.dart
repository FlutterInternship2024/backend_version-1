import 'package:flutter/material.dart';
import 'package:internshipapp/features/authentication/screens/signup/widgets/signupform.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                //Title
                Text(
                  TTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),

                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                //Form
                SignupForm(),
              ],
            ),
          ),
        ));
  }
}
