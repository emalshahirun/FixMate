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
