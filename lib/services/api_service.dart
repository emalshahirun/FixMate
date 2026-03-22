import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  // Use different URLs for different platforms
  static String get baseUrl {
    if (kIsWeb) {
      return 'http://localhost:8000/api';
    }
    // For Android emulator
    return 'http://10.0.2.2:8000/api';
    // For iOS simulator
    // return 'http://localhost:8000/api';
    // For physical device (replace with your computer's IP)
    // return 'http://192.168.x.x:8000/api';
  }
  
  static const String healthUrl = 'http://localhost:8000/health';
  
  // Store auth token
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }
  
  // Get stored token
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }
  
  // Clear token (logout)
  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }
  
  // Check if user is logged in
  static Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
  
  // Login with backend
  static Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        await saveToken(data['access_token']);
        return {'success': true, 'data': data};
      } else {
        final error = json.decode(response.body);
        return {'success': false, 'error': error['detail'] ?? 'Login failed'};
      }
    } catch (e) {
      return {'success': false, 'error': 'Connection error: $e'};
    }
  }
  
  // Register with backend
  static Future<Map<String, dynamic>> register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
          'name': name,
        }),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return {'success': true, 'data': data};
      } else {
        final error = json.decode(response.body);
        return {'success': false, 'error': error['detail'] ?? 'Registration failed'};
      }
    } catch (e) {
      return {'success': false, 'error': 'Connection error: $e'};
    }
  }
  
  // Get all addresses
  static Future<List<dynamic>> getAddresses() async {
    final token = await getToken();
    if (token == null) throw Exception('Not authenticated');
    
    final response = await http.get(
      Uri.parse('$baseUrl/addresses'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load addresses');
    }
  }
  
  // Create new address
  static Future<Map<String, dynamic>> createAddress({
    required String street,
    required String city,
    required String state,
    required String zipCode,
    required String country,
    double? latitude,
    double? longitude,
  }) async {
    final token = await getToken();
    if (token == null) throw Exception('Not authenticated');
    
    final body = {
      'street': street,
      'city': city,
      'state': state,
      'zip_code': zipCode,
      'country': country,
    };
    
    if (latitude != null) body['latitude'] = latitude;
    if (longitude != null) body['longitude'] = longitude;
    
    final response = await http.post(
      Uri.parse('$baseUrl/addresses'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode(body),
    );
    
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create address');
    }
  }
  
  // Update address
  static Future<Map<String, dynamic>> updateAddress({
    required int id,
    required String street,
    required String city,
    required String state,
    required String zipCode,
    required String country,
  }) async {
    final token = await getToken();
    if (token == null) throw Exception('Not authenticated');
    
    final response = await http.put(
      Uri.parse('$baseUrl/addresses/$id'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'street': street,
        'city': city,
        'state': state,
        'zip_code': zipCode,
        'country': country,
      }),
    );
    
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update address');
    }
  }
  
  // Delete address
  static Future<void> deleteAddress(int id) async {
    final token = await getToken();
    if (token == null) throw Exception('Not authenticated');
    
    final response = await http.delete(
      Uri.parse('$baseUrl/addresses/$id'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    
    if (response.statusCode != 200) {
      throw Exception('Failed to delete address');
    }
  }
  
  // Health check
  static Future<bool> checkHealth() async {
    try {
      final response = await http.get(Uri.parse(healthUrl));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  
  // Get user profile
  static Future<Map<String, dynamic>> getProfile() async {
    final token = await getToken();
    if (token == null) throw Exception('Not authenticated');
    
    final response = await http.get(
      Uri.parse('$baseUrl/profile'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load profile');
    }
  }
}