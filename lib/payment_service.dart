import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaymentService {
  static const String stripePublishableKey =
      'your_stripe_publishable_key'; // Replace with your key
  static const String stripeSecretKey =
      'your_stripe_secret_key'; // Use in backend, not here

  // For client-side, use Stripe SDK
  // But for simplicity, assume we call a backend endpoint

  static Future<bool> processPayment({
    required String paymentMethodId,
    required double amount,
    required String currency,
  }) async {
    try {
      // In a real app, call your backend API that uses Stripe
      // For demo, simulate success
      await Future.delayed(
        const Duration(seconds: 2),
      ); // Simulate network delay

      // Save payment to Firestore
      await FirebaseFirestore.instance.collection('payments').add({
        'paymentMethodId': paymentMethodId,
        'amount': amount,
        'currency': currency,
        'status': 'completed',
        'timestamp': FieldValue.serverTimestamp(),
      });

      return true;
    } catch (e) {
      print('Payment failed: $e');
      return false;
    }
  }

  // Example backend function (to be deployed as Firebase Cloud Function)
  /*
  const functions = require('firebase-functions');
  const stripe = require('stripe')(functions.config().stripe.secret);

  exports.createPaymentIntent = functions.https.onCall(async (data, context) => {
    const { amount, currency } = data;
    const paymentIntent = await stripe.paymentIntents.create({
      amount: amount * 100, // Stripe expects amount in cents
      currency: currency,
    });
    return { clientSecret: paymentIntent.client_secret };
  });
  */

  static Future<String?> createPaymentIntent(
    double amount,
    String currency,
  ) async {
    // Call your backend function
    const url =
        'https://your-region-your-project.cloudfunctions.net/createPaymentIntent';
    final response = await http.post(
      Uri.parse(url),
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
