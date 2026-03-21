import 'package:cloud_firestore/cloud_firestore.dart';

class BookingService {
  final CollectionReference bookings =
      FirebaseFirestore.instance.collection('bookings');


    Future<void> saveBooking({
    required String customerName,
    required String serviceType,
    required String date,
    required String duration,
  }) async {
    try {
      await bookings.add({
        'customerName': customerName,
        'serviceType': serviceType,
        'date': date,
        'duration': duration,
        'status': 'confirmed',
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print("Error saving booking: $e");
    }
  }
}

