import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaymentService {
  static Future<bool> processPayment({
    required String paymentMethodId,
    required double amount,
    required String currency,
  }) async {
    try {
      // Simulate gateway call (replace with real backend call)
      await Future.delayed(const Duration(seconds: 2));
      await FirebaseFirestore.instance.collection('payments').add({
        'paymentMethodId': paymentMethodId,
        'amount': amount,
        'currency': currency,
        'status': 'completed',
        'timestamp': FieldValue.serverTimestamp(),
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  // Optional: call real backend / function
  static Future<String?> createPaymentIntent(
    double amount,
    String currency,
  ) async {
    final url = Uri.parse(
      'https://your-cloud-function-url/createPaymentIntent',
    );
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'amount': amount, 'currency': currency}),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['clientSecret'];
    } else {
      throw Exception('Failed to create payment intent');
    }
  }
}
