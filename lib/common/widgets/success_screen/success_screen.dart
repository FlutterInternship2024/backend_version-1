import 'package:flutter/material.dart';
import 'package:internshipapp/common/styles/spacing_styles.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {Key? key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.onPressed})
      : super(key: key);
  final String image, title, subtitle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: TSpacingStyle.AppBarPadding,
        child: Column(children: [
          //Image
          //Title & subtitle
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),

          //Continue Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => onPressed,
                child: const Text(TTexts.tContinue)),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
        ]),
      ),
    ));
  }
}
