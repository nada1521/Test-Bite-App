import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/constants/firebase_strings.dart';

Future<String?> getUserCountry() async {
  final uid = FirebaseAuth.instance.currentUser?.uid;
  if (uid == null) return null;
  final doc = await FirebaseFirestore.instance
      .collection(FirebaseStrings.users)
      .doc(uid)
      .get();
  return doc.data()?[FirebaseStrings.country];
}
