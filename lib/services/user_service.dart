import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/models/user_model.dart';
import 'package:get/get.dart';

class UserService {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('USERS');

  Future<void> addUser(UserModel user) async {
    try {
      // Add user with the default role 'customer'
      await userCollection
          .doc(user.id) // Use the user's ID for their document
          .set(user.toJson())
          .whenComplete(() {
        Get.snackbar(
          "Success", // Title
          "Registration successful", // Message
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
      });
    } catch (e) {
      Get.snackbar(
        "Error", // Title
        "Failed to add user: $e", // Error Message
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
      throw Exception("Failed to add user: $e");
    }
  }

  // Method to update user role (admin only)
  Future<void> updateUserRole(String userId, String newRole) async {
    try {
      await userCollection.doc(userId).update({
        'Role': newRole, // Update the role to 'caretaker' or 'doctor'
      }).whenComplete(() {
        Get.snackbar(
          "Role Updated", // Title
          "User role has been updated to $newRole", // Message
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
      });
    } catch (e) {
      Get.snackbar(
        "Error", // Title
        "Failed to update role: $e", // Error Message
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
      throw Exception("Failed to update role: $e");
    }
  }
}
