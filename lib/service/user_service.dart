import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class UserService {
  final String baseUrl = 'http://127.0.0.1:8000/api/profile';
  final String updateProfileUrl = 'http://127.0.0.1:8000/api/update-profile';

  Future<UserModel?> fetchUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      print('Token tidak ditemukan');
      return null;
    }

    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body)['data']);
    } else {
      print('Error fetching user profile: ${response.statusCode}');
    }
    return null;
  }

  Future<bool> updateUserProfile(UserModel user) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   String? token = prefs.getString('token');

    if (token == null) {
      print('Token tidak ditemukan');
      return false;
    }

    final body = jsonEncode(user.toJson());
    print('Data yang dikirim: $body');

    final response = await http.put(
     Uri.parse(updateProfileUrl), // Gunakan URL yang benar untuk update
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: body,
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return response.statusCode == 200;
  }
}
