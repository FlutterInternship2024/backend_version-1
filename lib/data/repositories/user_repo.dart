import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:internshipapp/features/personalization/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {}
}
