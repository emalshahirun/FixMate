import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentService {
  final CollectionReference payments =
      FirebaseFirestore.instance.collection('payments');


   Future<bool> savePayment({
    required String paymentMode,
    required String amount,
    required String date,
    required String time,
  }) async {
     try {
      // Validation
      if (paymentMode.trim().isEmpty ||
          amount.trim().isEmpty ||
          date.trim().isEmpty ||
          time.trim().isEmpty) {
        throw Exception("All fields are required");
      }
