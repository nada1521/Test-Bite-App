import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/constants/firebase_strings.dart';

abstract class GetUserData {
  static Future<String?> getUserCountry() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return null;
    final doc = await FirebaseFirestore.instance
        .collection(FirebaseStrings.users)
        .doc(uid)
        .get();
    return doc.data()?[FirebaseStrings.country];
  }

  static Future<String?> getUserName() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return null;
    final doc = await FirebaseFirestore.instance
        .collection(FirebaseStrings.users)
        .doc(uid)
        .get();
    return doc.data()?[FirebaseStrings.firstName];
  }

  static Future<String?> getUserLastName() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return null;
    final doc = await FirebaseFirestore.instance
        .collection(FirebaseStrings.users)
        .doc(uid)
        .get();
    return doc.data()?[FirebaseStrings.lastName];
  }

  
  static Future<String?> getUserEmail() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return null;
    final doc = await FirebaseFirestore.instance
        .collection(FirebaseStrings.users)
        .doc(uid)
        .get();
    return doc.data()?[FirebaseStrings.email];
  }

  static Future<String?> getUserPassworde() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return null;
    final doc = await FirebaseFirestore.instance
        .collection(FirebaseStrings.users)
        .doc(uid)
        .get();
    return doc.data()?[FirebaseStrings.password];
  }
}
 Future<String?> getUserPhoneNumber() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return null;
    final doc = await FirebaseFirestore.instance
        .collection(FirebaseStrings.users)
        .doc(uid)
        .get();
    return doc.data()?[FirebaseStrings.phoneNumber];
  }
