import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:internshipapp/bindings/general_bindings.dart';
import 'package:internshipapp/features/authentication/screens/signup/signup.dart';
import 'package:internshipapp/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBinidings(),
      home: SignupScreen(),
    );
  }
}
