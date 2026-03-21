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
       const validModes = ["Card", "Cash", "Master card", "Visa"];
      if (!validModes.contains(paymentMode)) {
        throw Exception("Invalid payment mode");
      }

      // Save to Firestore
      await payments.add({
        'paymentMode': paymentMode,
        'amount': parsedAmount,
        'date': date,
        'time': time,
        'timestamp': FieldValue.serverTimestamp(),
      });

      return true;
    } catch (e) {
      print("❌ Error saving payment: $e");
      return false;
    }
  }
}
