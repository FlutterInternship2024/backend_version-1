import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internshipapp/features/authentication/screens/signup/signup.dart';
import 'package:internshipapp/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:internshipapp/utils/exceptions/firebase_exceptions.dart';
import 'package:internshipapp/utils/exceptions/format_exceptions.dart';
import 'package:internshipapp/utils/exceptions/platform_exceptions.dart';

import '../../features/authentication/screens/signup/login.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // called on app launch from main.dart
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

// Show relevant Screen
  screenRedirect() async {
    /// Local Storage
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const SignupScreen());
  }

  /*----------Email Password signin-----------*/

  /// Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong !!';
    }
  }
}
